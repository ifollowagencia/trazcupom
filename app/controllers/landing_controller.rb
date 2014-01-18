class LandingController < ApplicationController

  def page


    #validando usuario logado
    if user_signed_in?
      
      redirect_to  :controller => 'home', :action => 'nearme'
      
    end
    #resolvido
    @rec = Establishment.paginate(:page => params[:page]) # replaces Post.all
    
    @location = getlocation
    #link parceiros

   # @link_area_parceiros = link_to 'Área do parceiro', :controller => 'establishments', :action => 'new'

  end
 
  def getlocation
    result = request.location.ip
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
