class AddressEstablishmentsController < ApplicationController
  before_action :set_address_establishment, only: [:show, :edit, :update, :destroy]

  # GET /address_establishments
  # GET /address_establishments.json
  def index
    #if params[:search].present?
    #@address_establishment = AddressEstablishment.near(params[:search], 50, :order => :distance)
  #else
    @address_establishments = AddressEstablishment.all
  #end
  end

  # GET /address_establishments/1
  # GET /address_establishments/1.json
  def show
  end

  # GET /address_establishments/new
  def new
    @address_establishment = AddressEstablishment.new
  end

  # GET /address_establishments/1/edit
  def edit
  end

  # POST /address_establishments
  # POST /address_establishments.json
  def create
    @address_establishment = AddressEstablishment.new(address_establishment_params)

    respond_to do |format|
      if @address_establishment.save
        format.html { redirect_to @address_establishment, notice: 'Address Establishment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @address_establishment }
      else
        format.html { render action: 'new' }
        format.json { render json: @address_establishment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /address_establishments/1
  # PATCH/PUT /address_establishments/1.json
  def update
    respond_to do |format|
      if @address_establishment.update(address_establishment_params)
        format.html { redirect_to @address_establishment, notice: 'AddressEstablishment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @address_establishment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /address_establishments/1
  # DELETE /address_establishments/1.json
  def destroy
    @address_establishment.destroy
    respond_to do |format|
      format.html { redirect_to address_establishments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address_establishment
      @address_establishment = AddressEstablishment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def address_establishment_params
      params.require(:address_establishment).permit(:address, :latitude, :longitude, :establishment_id)
    end
end
