class HomeController < ApplicationController

helper :home

WillPaginateRenderers.pagination_options[:twitter_label] = "Carregar mais"

WillPaginateRenderers.pagination_options[:twitter_class] = 'buttom_twitter'
   # GET /offers
  # GET /offers.xml
  def nearme 
    @city = params[:city_id]  
    session[:city] = @city

  	if user_signed_in?
  		#pegar dados do usuario logado
     
    puts "Cidade: #{@city}"
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
    
    @estabs = Establishment.find(:all, :order => "id desc", :limit => 16).reverse

  end

  def cuponsrecentes
    
    @cuponsrecentes = Offer.find(:all, :order => "id desc", :limit => 9).reverse

  end






end
