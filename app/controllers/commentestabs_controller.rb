class CommentestabsController < ApplicationController
  before_action :set_commentestab, only: [:show, :edit, :update, :destroy]

  # GET /commentestabs
  # GET /commentestabs.json
  def index
    @commentestabs = Commentestab.all
  end

  # GET /commentestabs/1
  # GET /commentestabs/1.json
  def show
  end

  # GET /commentestabs/new
  def new
    @commentestab = Commentestab.new
  end

  # GET /commentestabs/1/edit
  def edit
  end

  # POST /commentestabs
  # POST /commentestabs.json
  def create
    @commentestab = Commentestab.new(commentestab_params)

    respond_to do |format|
      if @commentestab.save
        format.html { redirect_to @commentestab, notice: 'Commentestab was successfully created.' }
        format.json { render action: 'show', status: :created, location: @commentestab }
      else
        format.html { render action: 'new' }
        format.json { render json: @commentestab.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /commentestabs/1
  # PATCH/PUT /commentestabs/1.json
  def update
    respond_to do |format|
      if @commentestab.update(commentestab_params)
        format.html { redirect_to @commentestab, notice: 'Commentestab was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @commentestab.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /commentestabs/1
  # DELETE /commentestabs/1.json
  def destroy
    @commentestab.destroy
    respond_to do |format|
      format.html { redirect_to commentestabs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_commentestab
      @commentestab = Commentestab.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def commentestab_params
      params.require(:commentestab).permit(:comment, :establishment_id, :user_id)
    end
end
