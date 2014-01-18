class LikeestablishmentsController < ApplicationController
  before_action :set_likeestablishment, only: [:show, :edit, :update, :destroy]

  # GET /likeestablishments
  # GET /likeestablishments.json
  def index
    @likeestablishments = Likeestablishment.all
  end

  # GET /likeestablishments/1
  # GET /likeestablishments/1.json
  def show
  end

  # GET /likeestablishments/new
  def new
    @likeestablishment = Likeestablishment.new
  end

  # GET /likeestablishments/1/edit
  def edit
  end

  # POST /likeestablishments
  # POST /likeestablishments.json
  def create
    @likeestablishment = Likeestablishment.new(likeestablishment_params)

    respond_to do |format|
      if @likeestablishment.save
        format.html { redirect_to @likeestablishment, notice: 'Likeestablishment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @likeestablishment }
      else
        format.html { render action: 'new' }
        format.json { render json: @likeestablishment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /likeestablishments/1
  # PATCH/PUT /likeestablishments/1.json
  def update
    respond_to do |format|
      if @likeestablishment.update(likeestablishment_params)
        format.html { redirect_to @likeestablishment, notice: 'Likeestablishment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @likeestablishment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /likeestablishments/1
  # DELETE /likeestablishments/1.json
  def destroy
    @likeestablishment.destroy
    respond_to do |format|
      format.html { redirect_to likeestablishments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_likeestablishment
      @likeestablishment = Likeestablishment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def likeestablishment_params
      params.require(:likeestablishment).permit(:count, :establishment_id)
    end
end
