class UserController < ApplicationController


  def index
      #validar login
    if user_signed_in?
      #pegar dados do usuario logado

    @name = current_user.name

    @user = current_user  



    else
      
      redirect_to new_user_session_path

    end

  end

  def tickets
    @cupons = Download.where('user_id = ?', current_user.id)
    @cupons_baixados = @cupons.paginate(:page=>params[:page], :per_page => 6)
    puts @cupons_baixados
  end

  def download
 
    result = Download.where("user_id = ? AND offer_id = ?", current_user.id, params[:idoffer]).count

    if result > 0 
      flash[:notice] = 'Você não pode mais baixar este cupom!' 
      redirect_to :controller => 'user', :action => 'tickets'
    else
    #option to save voucher 
    o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten

    code = (0...10).map { o[rand(o.length)] }.join

    download = Download.new(:offer_id => params[:idoffer],:user_id => current_user.id, :code => code)

    #definido o disparo dos emails
    @offer = Offer.find(params[:idoffer])
    if download.save
      UserMailer.download_ticket(params[:idoffer], @offer.establishment.id,current_user.id).deliver
      
      flash[:message] = 'Parabéns, desfrute seu cupom de desconto :)' 
      
      redirect_to :controller => 'user', :action => 'tickets', :notice => 'Parabéns, desfrute seu cupom de desconto :)'
    
    else
      flash[:notice] = 'Tivemos um erro ao tentar baixar o seu cupom, tente novamente!' 
      redirect_to :controller => 'user', :action => 'tickets', :notice => 'Tivemos um erro ao tentar baixar o seu cupom, tente novamente!'
    end
    end

  end

  def print
    @offer = Offer.find(params[:idoffer])
    @code = Download.where("offer_id = ? AND user_id = ?", params[:idoffer], current_user.id)
    
  end



  def profile

  	#validar login
  	if user_signed_in?
  		#pegar dados do usuario logado

  	@name = current_user.name

  	@user = current_user	



  	else
  		
  		redirect_to new_user_session_path

  	end

  end

  def edit
    
    @user = User.find(params[:id])

    puts @user.name

      
      redirect_to :controller => "user", :action => "profile"


  end


  def show
    #validar login
    if user_signed_in?
      #pegar dados do usuario logado

    @name = current_user.name

    @user = current_user  



    else
      
      redirect_to new_user_session_path

    end
  end


  def update
  @user = User.find(params[:id])
  if @user.update_attributes(:name,params[:name])
    flash[:success] = "Profile updated."
    redirect_to :controller => 'user', :action => 'profile'
  else
    flash[:success] = "Profile updated not."
  end
  end


 


end
