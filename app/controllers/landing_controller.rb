class LandingController < ApplicationController
helper :home

WillPaginateRenderers.pagination_options[:twitter_label] = "Carregar mais estabelecimentos"

WillPaginateRenderers.pagination_options[:twitter_class] = 'buttom_twitter'
  def page


    #validando usuario logado
    if user_signed_in?
      
      redirect_to  :controller => 'home', :action => 'nearme'
      
    end
    #resolvido
    #@rec = Establishment.paginate(:page => params[:page]) # replaces Post.all
    
    resultoffer = Establishment.all
    sleep 1
    @rec = resultoffer.paginate(:page=>params[:page], :per_page => 6)

    @tickets = gettickets

    @location = getlocation
    #link parceiros

   # @link_area_parceiros = link_to 'Área do parceiro', :controller => 'establishments', :action => 'new'

  end

  def gettickets
    resultoffer = Offer.all
    sleep 1
    @tickets = resultoffer.paginate(:page=>params[:page], :per_page => 3)
  end
 
  def getlocation
    location_info =  request.location
    #@location = City.nearbys(50)
    @a = request.location.try(:city)
    puts @a
  end


  def recomendamos
    
    #@rec = Establishment.last(4)
    @rec = Establishment.paginate(:page => params[:page], :per_page => 4)

  end

  def anuncie
    
  end

  def new
    @establishment = Establishment.new
  end

  # POST /establishments
  # POST /establishments.json
  def create
    @establishment = Establishment.new(establishment_params)

    respond_to do |format|
      if @establishment.save
        format.html { redirect_to @establishment, notice: 'Establishment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @establishment }
      else
        format.html { render action: 'new' }
        format.json { render json: @establishment.errors, status: :unprocessable_entity }
      end
    end
  end

  
end
