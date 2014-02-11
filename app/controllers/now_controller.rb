require 'will_paginate/array' #dependencia will_paginate

class NowController < ApplicationController

helper :home #help home

WillPaginateRenderers.pagination_options[:twitter_label] = "Carregar mais" #render twitter pagination

WillPaginateRenderers.pagination_options[:twitter_class] = "buttom_twitter" #render twitter pagination

  def index
  	#controller da pagina principal
  	 @city = params[:city_id]
    session[:city] = @city

    if user_signed_in?
      #pegar dados do usuario logado

      puts "Cidade: #{@city}"
      @name = current_user.name
      @estabs = estabs

      sleep 1

      @cupons = offer_suggestions.paginate(page: params[:page], per_page: 3)

      @all_cupons = Offer.paginate(page: params[:page], per_page: 6)

      @pins = AddressEstablishment.all
      build_makers_for_map
    else
      # caso não esteja logado redireciona pro login
      redirect_to new_user_session_path
    end

  end #end action index


  def estabs
    @estabs = Establishment.find(:all, :order => "id DESC", :limit => 16).reverse
  end

  def cuponsrecentes
    @cuponsrecentes = Offer.all.order(validity: :desc).limit(9).reverse
  end

  private

  def offer_suggestions
    if current_user.visited_offers.empty?
      Offer.all
    else
      Offer.suggestions_by_category_establishments(current_user)
    end
  end

  def build_makers_for_map
    @pins = AddressEstablishment.all
    @hash = Gmaps4rails.build_markers(@pins) do |pin, marker|
      marker.lat pin.latitude
      marker.lng pin.longitude
    end
  end

end
