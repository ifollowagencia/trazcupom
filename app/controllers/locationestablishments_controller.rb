class LocationestablishmentsController < ApplicationController
  def index
    if params[:search].present?
    @locationestablishment = Locationestablishment.near(params[:search], 50, :order => :distance)
  else
    @locationestablishment = Locationestablishment.all
  end
  end

  def show
    @locationestablishment = Locationestablishment.find(params[:id])
  end

  def new
    @locationestablishment = Locationestablishment.new
  end

  def create
    @locationestablishment = Locationestablishment.new(params[:locationestablishment])
    if @locationestablishment.save
      redirect_to @locationestablishment, :notice => "Successfully created locationestablishment."
    else
      render :action => 'new'
    end
  end

  def edit
    @locationestablishment = Locationestablishment.find(params[:id])
  end

  def update
    @locationestablishment = Locationestablishment.find(params[:id])
    if @locationestablishment.update_attributes(params[:locationestablishment])
      redirect_to @locationestablishment, :notice  => "Successfully updated locationestablishment."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @locationestablishment = Locationestablishment.find(params[:id])
    @locationestablishment.destroy
    redirect_to locationestablishments_url, :notice => "Successfully destroyed locationestablishment."
  end


 private
    # Use callbacks to share common setup or constraints between actions.
    def set_establishment
      @establishment = Establishment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def establishment_params
      params.require(:establishment).permit(:address)
    end

end
