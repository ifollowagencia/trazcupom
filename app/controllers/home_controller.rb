class HomeController < ApplicationController

helper :home

WillPaginateRenderers.pagination_options[:twitter_label] = "Carregar mais cupons"

WillPaginateRenderers.pagination_options[:twitter_class] = 'buttom_twitter'
   # GET /offers
  # GET /offers.xml
  def nearme
  	if user_signed_in?
  		#pegar dados do usuario logado

  	@name = current_user.name
    @estabs = estabs
    resultoffer = Offer.all
    sleep 1
    @cupons = resultoffer.paginate(:page=>params[:page], :per_page => 6)


  	else
  		
  		redirect_to new_user_session_path

  	end
  	
  end  #final do método nearme


  def estabs
    
    @estabs = Establishment.find(:all, :order => "id desc", :limit => 8).reverse

  end

  def cuponsrecentes
    
    @cuponsrecentes = Offer.find(:all, :order => "id desc", :limit => 9).reverse

  end

  def getdiscount(idoffer)

      @offer = Offer.find(idoffer)
    #pegar o produto anunciado nessa oferta
      @product = getproduct(@offer.product.id)

      @oldprice = @product.price

      @youngprice = @offer.priceproduct

      # Algoritmo para calcular a porcentagem de desconto , na verdade calcular uma porcentagem mais veloz

      @mult = (@youngprice * 100.0) / @oldprice

      @div = @mult / @oldprice     

      @porcentagem = 100.0 - @mult
    
  end

  def getproduct(idproduct)
      @product = Product.find(idproduct)
  end




end
