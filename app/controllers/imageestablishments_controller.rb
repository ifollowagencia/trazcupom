class ImageestablishmentsController < ApplicationController
  before_action :set_imageestablishment, only: [:show, :edit, :update, :destroy]

  # GET /imageestablishments
  # GET /imageestablishments.json
  def index
    @imageestablishments = Imageestablishment.all
  end

  # GET /imageestablishments/1
  # GET /imageestablishments/1.json
  def show
  end

  # GET /imageestablishments/new
  def new
    @imageestablishment = Imageestablishment.new
  end

  # GET /imageestablishments/1/edit
  def edit
  end

  # POST /imageestablishments
  # POST /imageestablishments.json
  def create
    @imageestablishment = Imageestablishment.new(imageestablishment_params)

    respond_to do |format|
      if @imageestablishment.save
        format.html { redirect_to @imageestablishment, notice: 'Imageestablishment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @imageestablishment }
      else
        format.html { render action: 'new' }
        format.json { render json: @imageestablishment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /imageestablishments/1
  # PATCH/PUT /imageestablishments/1.json
  def update
    respond_to do |format|
      if @imageestablishment.update(imageestablishment_params)
        format.html { redirect_to @imageestablishment, notice: 'Imageestablishment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @imageestablishment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /imageestablishments/1
  # DELETE /imageestablishments/1.json
  def destroy
    @imageestablishment.destroy
    respond_to do |format|
      format.html { redirect_to imageestablishments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_imageestablishment
      @imageestablishment = Imageestablishment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def imageestablishment_params
      params.require(:imageestablishment).permit(:image, :establishment_id)
    end
end
