require 'will_paginate/array'

class LandingController < ApplicationController
helper :home

WillPaginateRenderers.pagination_options[:twitter_label] = "Carregar mais"

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
    @rec = resultoffer.paginate(:page=>params[:page], :per_page => 4)

    @tickets = gettickets
    
    @location = Geocoder.search(get_ip_by_env).first
    @estabs = find_establishments_by_location "Campo Grande" #@location.data["city"]
    offers_relation = @estabs.map { |es| es.offers }
    @offers = offers_relation.flatten.paginate(:page => params[:page], :per_page => 1)
    
    ######@location = getlocation
    #link parceiros

   # @link_area_parceiros = link_to 'Área do parceiro', :controller => 'establishments', :action => 'new'

  end

    def ticket


    #validando usuario logado
    if user_signed_in?
      
      redirect_to  :controller => 'home', :action => 'nearme'
      
    end
    #resolvido
    #@rec = Establishment.paginate(:page => params[:page]) # replaces Post.all
    
    resultoffer = Establishment.all
    sleep 1
    @rec = resultoffer.paginate(:page=>params[:page], :per_page => 4)

    @tickets = gettickets

    @location = getlocation
    #link parceiros

   # @link_area_parceiros = link_to 'Área do parceiro', :controller => 'establishments', :action => 'new'

  end

  def gettickets
    resultoffer = Offer.all
    sleep 1
    @tickets = resultoffer.paginate(:page=>params[:page], :per_page => 2)
  end
 
  def getlocation
    location_info = request.location
    #@location = City.nearbys(50)
    @a = request.location.try(:city)
    puts @a
  end


  def recomendamos
    #@rec = Establishment.last(4)
    @rec = Establishment.paginate(:page => params[:page], :per_page => 4)
  end

  def anuncie; end

  def new
    @establishment = Establishment.new
  end

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
  
  private
  def get_ip_by_env
    (Rails.env.eql?("development") || Rails.env.eql?("staging")) ? "189.52.48.2" : request.remote_ip
  end

  def find_establishments_by_location(city_name)
    city = City.where(name: city_name).first
    Establishment.where(city_id: city.id) rescue []
  end
end