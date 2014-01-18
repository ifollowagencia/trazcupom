class AddressestablishmentsController < ApplicationController
  before_action :set_addressestablishment, only: [:show, :edit, :update, :destroy]

  # GET /addressestablishments
  # GET /addressestablishments.json
  def index
    if params[:search].present?
    @addressestablishment = Addressestablishment.near(params[:search], 50, :order => :distance)
  else
    @addressestablishment = Addressestablishment.all
  end
  end

  # GET /addressestablishments/1
  # GET /addressestablishments/1.json
  def show
  end

  # GET /addressestablishments/new
  def new
    @addressestablishment = Addressestablishment.new
  end

  # GET /addressestablishments/1/edit
  def edit
  end

  # POST /addressestablishments
  # POST /addressestablishments.json
  def create
    @addressestablishment = Addressestablishment.new(addressestablishment_params)

    respond_to do |format|
      if @addressestablishment.save
        format.html { redirect_to @addressestablishment, notice: 'Addressestablishment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @addressestablishment }
      else
        format.html { render action: 'new' }
        format.json { render json: @addressestablishment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /addressestablishments/1
  # PATCH/PUT /addressestablishments/1.json
  def update
    respond_to do |format|
      if @addressestablishment.update(addressestablishment_params)
        format.html { redirect_to @addressestablishment, notice: 'Addressestablishment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @addressestablishment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /addressestablishments/1
  # DELETE /addressestablishments/1.json
  def destroy
    @addressestablishment.destroy
    respond_to do |format|
      format.html { redirect_to addressestablishments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_addressestablishment
      @addressestablishment = Addressestablishment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def addressestablishment_params
      params.require(:addressestablishment).permit(:address, :latitude, :longitude, :establishment_id)
    end
end
