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
    @cupons_baixados = Download.where('user_id = ?', current_user.id)
    puts @cupons_baixados
  end

  def download
    puts "entrei"
    result = Download.where("user_id = ? AND offer_id = ?", current_user.id, params[:idoffer]).count

    if result > 0 
      flash[:notice] = 'Você não pode mais baixar este cupom!' 
      redirect_to :controller => 'user', :action => 'tickets'
    else
    o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
    code = (0...10).map { o[rand(o.length)] }.join
    download = Download.new(:offer_id => params[:idoffer],:user_id => current_user.id, :code => code)
    if download.save
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
  if @user.update_attributes(params[:user])
    flash[:success] = "Profile updated."
    redirect_to :controller => 'user', :action => 'profile'
  else
    flash[:success] = "Profile updated not."
  end
  end


   def user_params
    # NOTE: Using `strong_parameters` gem
    params.required(:user).permit(:phone, :image, :city_id, :namefull, :nascimento,:password, :password_confirmation)
  end



end
