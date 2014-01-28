class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy]

  helper :home


  # GET /offers
  # GET /offers.json
  def index
    @offers = Offer.all
  end

  # GET /offers/1
  # GET /offers/1.json
  def show
    if user_signed_in?

      #pegar o produto anunciado nessa oferta
      @product = getproduct(@offer.product.id)

      @oldprice = @product.price

      @youngprice = @offer.priceproduct

      # Algoritmo para calcular a porcentagem de desconto , na verdade calcular uma porcentagem mais veloz

      # finalizado algoritmo para calcular o disconto total no produto

      # printando no mapa o endereço do estabelecimento
      @address = Addressestablishment.where("establishment_id = ?", @offer.establishment_id)
      @location = Addressestablishment.find(@address)

      #notes
      @note = Note.where("offer_id = ?", @offer)
      @rule = Rule.where("offer_id = ?", @offer)

    else
      redirect_to new_user_session_path

    end # validando usuario logado para visualizar cupom
  end


  def getproduct(idproduct)
      @product = Product.find(idproduct)
  end


  # GET /offers/new
  def new
    @offer = Offer.new
  end

  # GET /offers/1/edit
  def edit
  end

  # POST /offers
  # POST /offers.json
  def create
    @offer = Offer.new(offer_params)

    respond_to do |format|
      if @offer.save
        format.html { redirect_to @offer, notice: 'Offer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @offer }
      else
        format.html { render action: 'new' }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offers/1
  # PATCH/PUT /offers/1.json
  def update
    respond_to do |format|
      if @offer.update(offer_params)
        format.html { redirect_to @offer, notice: 'Offer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offers/1
  # DELETE /offers/1.json
  def destroy
    @offer.destroy
    respond_to do |format|
      format.html { redirect_to offers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offer
      @offer = Offer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def offer_params
      params.require(:offer).permit(:name, :description, :establishment_id, :product_id, :amount, :validity, :date, :image1, :image2, :image3, :image4, :status, :priceproduct)
    end
end
