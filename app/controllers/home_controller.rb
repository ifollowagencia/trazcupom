require 'will_paginate/array'

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

      sleep 1

      @cupons = offer_suggestions.paginate(page: params[:page], per_page: 6)

      @pins = Addressestablishment.all
      build_makers_for_map
      
    else
      # caso não esteja logado redireciona pro login
      redirect_to new_user_session_path
    end

  end  #final do método nearme

  def gmaps4rails_marker_picture
    {
      "picture" => "http://www.trazcupom.com/home/images/location.png",
      "width" => 32, #beware to resize your pictures properly
      "height" => 32 #beware to resize your pictures properly
    }
  end

  def estabs
    @estabs = Establishment.find(:all, :order => "id DESC", :limit => 16).reverse
  end

  def cuponsrecentes
    @cuponsrecentes = Offer.all.order(validity: :desc).limit(9).reverse
    #@cuponsrecentes = Offer.find(:all, :order => "validity DESC", :limit => 9).reverse
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
    @pins = Addressestablishment.all
    @hash = Gmaps4rails.build_markers(@pins) do |pin, marker|
      marker.lat pin.latitude
      marker.lng pin.longitude

    end
  end

end
