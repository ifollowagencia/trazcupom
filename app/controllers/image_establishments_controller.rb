class ImageEstablishmentsController < ApplicationController
  before_action :set_image_establishment, only: [:show, :edit, :update, :destroy]

  def index
    @image_establishments = ImageEstablishment.all
  end

  def show
  end


  def new
    @image_establishment = ImageEstablishment.new
  end


  def edit
  end

  def create
    @image_establishment = ImageEstablishment.new(image_establishment_params)

    respond_to do |format|
      if @image_establishment.save
        format.html { redirect_to @image_establishment, notice: 'ImageEstablishment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @image_establishment }
      else
        format.html { render action: 'new' }
        format.json { render json: @image_establishment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @image_establishment.update(image_establishment_params)
        format.html { redirect_to @image_establishment, notice: 'ImageEstablishment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @image_establishment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @image_establishment.destroy
    respond_to do |format|
      format.html { redirect_to image_establishments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image_establishment
      @image_establishment = ImageEstablishment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_establishment_params
      params.require(:image_establishment).permit(:image, :establishment_id)
    end
end
