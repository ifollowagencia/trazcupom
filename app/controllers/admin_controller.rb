class AdminController < ApplicationController
 # Controller para administração interna nossa

  def dashboard
  end


  def timeline
  	# pegar toda a experiencia dos usuários e mostrar com ajax para termos acesso a estes dados.	
  	@users = User.all
  	@downloads = Download.all
  	@offers = Offer.all
  	@establishments = Establishment.all	
    
    @pins = Addressestablishment.all
    @hash = Gmaps4rails.build_markers(@pins) do |pin, marker|
    marker.lat pin.latitude
    marker.lng pin.longitude
    end
  end
end
