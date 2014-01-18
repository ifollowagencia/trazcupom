class EstablishmentsController < ApplicationController
  before_action :set_establishment, only: [:show, :edit, :update, :destroy]

  # GET /establishments
  # GET /establishments.json
  def index
    @establishments = Establishment.all
  end

  def countlike(estab)
    
    puts estab
    @likes = Likeestablishment.where(:establishment_id => estab).count
  end

  def likeestab
    

    @likeestablishment = Likeestablishment.new(:establishment_id => params[:estab])
    @establishment = params[:estab]
    
      if @likeestablishment.save
      redirect_to :back
      end
    redirect_to :back
  end
  # GET /establishments/1
  # GET /establishments/1.json
  def show
    if user_signed_in?

     @address = Addressestablishment.where("establishment_id = ?", params[:id])
     @location = Addressestablishment.find(@address)

     @likes = countlike(params[:id])
     @comments = Commentestab.where("establishment_id = ?", params[:id])
    else
      redirect_to new_user_session_path
    end
  end

  # GET /establishments/new
  def new
    @establishment = Establishment.new
  end

  # GET /establishments/1/edit
  def edit
  end

  # POST /establishments
  # POST /establishments.json
  def create
    @establishment = Establishment.new(establishment_params)

    respond_to do |format|
      if @establishment.save
        if @establishment.plan_id == 1
          format.html { redirect_to :controller => "partner", :action => "login" , notice: 'Conta criada com sucesso!' }
        end
        format.html { redirect_to @establishment, notice: 'Establishment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @establishment }
      else
        format.html { render action: 'new' }
        format.json { render json: @establishment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /establishments/1
  # PATCH/PUT /establishments/1.json
  def update
    respond_to do |format|
      if @establishment.update(establishment_params)
        format.html { redirect_to @establishment, notice: 'Establishment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @establishment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /establishments/1
  # DELETE /establishments/1.json
  def destroy
    @establishment.destroy
    respond_to do |format|
      format.html { redirect_to establishments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_establishment
      @establishment = Establishment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def establishment_params
      params.require(:establishment).permit(:name, :surname, :phone, :email, :password, :cnpj, :reason, :city_id, :plan_id, :imageprofile)
    end
end
