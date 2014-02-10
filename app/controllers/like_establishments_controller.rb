class LikeEstablishmentsController < ApplicationController
  before_action :set_like_establishment, only: [:show, :edit, :update, :destroy]

  def index
    @like_establishments = LikeEstablishment.all
  end

  def show
  end

  def new
    @like_establishment = LikeEstablishment.new
  end

  def edit
  end

  def create
    @like_establishment = LikeEstablishment.new(like_establishment_params)

    respond_to do |format|
      if @like_establishment.save
        format.html { redirect_to @like_establishment, notice: 'LikeEstablishment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @like_establishment }
      else
        format.html { render action: 'new' }
        format.json { render json: @like_establishment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @like_establishment.update(like_establishment_params)
        format.html { redirect_to @like_establishment, notice: 'LikeEstablishment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @like_establishment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @like_establishment.destroy
    respond_to do |format|
      format.html { redirect_to like_establishments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_like_establishment
      @like_establishment = LikeEstablishment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def like_establishment_params
      params.require(:like_establishment).permit(:count, :establishment_id)
    end
end
