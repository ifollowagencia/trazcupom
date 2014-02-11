class UserController < ApplicationController

  before_action :set_user, only: [:edit, :update, :destroy]
  before_filter :authenticate_user!

  def index
    @name = current_user.name
    @user = current_user
  end

  def tickets
    @cupons = Download.where('user_id = ?', current_user.id)
    @cupons_baixados = @cupons.paginate(:page=>params[:page], :per_page => 6)
  end

  def download
    
    result = Download.where("user_id = ? AND offer_id = ?", current_user.id, params[:idoffer]).count
    qtdoffer = Offer.where("id = ?", params[:idoffer]).first

    qtd = Download.where("offer_id = ?", params[:idoffer]).count


    if qtd == qtdoffer.amount

      flash[:notice] = 'Infelizmente o número de downloads deste cupom se esgotou :(, acompanhe nosso aplicativo e aproveite!'
      redirect_to :controller => 'user', :action => 'tickets'


    else  
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
        PartnerMailer.send_ticket(params[:idoffer], @offer.establishment.id,current_user.id).deliver
        flash[:message] = 'Parabéns, desfrute seu cupom de desconto :)'
        redirect_to :controller => 'user', :action => 'tickets', :notice => 'Parabéns, desfrute seu cupom de desconto :)'
      else
        flash[:notice] = 'Tivemos um erro ao tentar baixar o seu cupom, tente novamente!'
        redirect_to :controller => 'user', :action => 'tickets', :notice => 'Tivemos um erro ao tentar baixar o seu cupom, tente novamente!'
      end #fim if download.save
    
    end # fim if result 0
    end
  end # fim action

  def print
    @offer = Offer.find(params[:idoffer])
    @code = Download.where("offer_id = ? AND user_id = ?", params[:idoffer], current_user.id)
  end

  def profile
    @name = current_user.name
    @user = current_user
  end

  def edit
  end


  def show
    @name = current_user.name
    @user = current_user
  end


  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user, notice: 'Profile Updated'
    else
      render action: 'profile'
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:name, :image, :namefull, :phone, :city, :nascimento, :city_id)
  end
end
