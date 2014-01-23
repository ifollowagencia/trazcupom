class CategoryestablishmentsController < ApplicationController
  before_action :set_categoryestablishment, only: [:show, :edit, :update, :destroy]

  # GET /categoryestablishments
  # GET /categoryestablishments.json
  def index
    @categoryestablishments = Categoryestablishment.all
  end

  # GET /categoryestablishments/1
  # GET /categoryestablishments/1.json
  def show
  end

  # GET /categoryestablishments/new
  def new
    @categoryestablishment = Categoryestablishment.new
  end

  # GET /categoryestablishments/1/edit
  def edit
  end

  # POST /categoryestablishments
  # POST /categoryestablishments.json
  def create
    @categoryestablishment = Categoryestablishment.new(categoryestablishment_params)

    respond_to do |format|
      if @categoryestablishment.save
        format.html { redirect_to @categoryestablishment, notice: 'Categoryestablishment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @categoryestablishment }
      else
        format.html { render action: 'new' }
        format.json { render json: @categoryestablishment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categoryestablishments/1
  # PATCH/PUT /categoryestablishments/1.json
  def update
    respond_to do |format|
      if @categoryestablishment.update(categoryestablishment_params)
        format.html { redirect_to @categoryestablishment, notice: 'Categoryestablishment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @categoryestablishment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categoryestablishments/1
  # DELETE /categoryestablishments/1.json
  def destroy
    @categoryestablishment.destroy
    respond_to do |format|
      format.html { redirect_to categoryestablishments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_categoryestablishment
      @categoryestablishment = Categoryestablishment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def categoryestablishment_params
      params.require(:categoryestablishment).permit(:name)
    end
end
