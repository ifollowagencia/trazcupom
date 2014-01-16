class HomeController < ApplicationController
  
  def nearme
  	if user_signed_in?
  		#pegar dados do usuario logado

  	@name = current_user.name
    @estabs = estabs
    @cupons = cuponsrecentes
  	else
  		
  		redirect_to new_user_session_path

  	end
  	
  end  #final do método nearme


  


  def estabs
    
    @estabs = Establishment.find(:all, :order => "id desc", :limit => 4).reverse

  end

  def cuponsrecentes
    
    @cuponsrecentes = Offer.find(:all, :order => "id desc", :limit => 4).reverse

  end




end
