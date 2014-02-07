class CategoryEstablishmentsController < ApplicationController
  before_action :set_CategoryEstablishment, only: [:show, :edit, :update, :destroy]

  # GET /CategoryEstablishments
  # GET /CategoryEstablishments.json
  def index
    @category_establishments = CategoryEstablishment.all
  end

  # GET /CategoryEstablishments/1
  # GET /CategoryEstablishments/1.json
  def show
  end

  # GET /CategoryEstablishments/new
  def new
    @category_establishment = CategoryEstablishment.new
  end

  # GET /CategoryEstablishments/1/edit
  def edit
  end

  # POST /CategoryEstablishments
  # POST /CategoryEstablishments.json
  def create
    @category_establishment = CategoryEstablishment.new(CategoryEstablishment_params)

    respond_to do |format|
      if @category_establishment.save
        format.html { redirect_to @category_establishment, notice: 'CategoryEstablishment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @category_establishment }
      else
        format.html { render action: 'new' }
        format.json { render json: @category_establishment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /CategoryEstablishments/1
  # PATCH/PUT /CategoryEstablishments/1.json
  def update
    respond_to do |format|
      if @category_establishment.update(CategoryEstablishment_params)
        format.html { redirect_to @category_establishment, notice: 'CategoryEstablishment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @category_establishment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /CategoryEstablishments/1
  # DELETE /CategoryEstablishments/1.json
  def destroy
    @category_establishment.destroy
    respond_to do |format|
      format.html { redirect_to CategoryEstablishments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_CategoryEstablishment
      @category_establishment = CategoryEstablishment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def CategoryEstablishment_params
      params.require(:CategoryEstablishment).permit(:name)
    end
end
