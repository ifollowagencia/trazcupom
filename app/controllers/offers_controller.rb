require 'will_paginate/array' #dependencia will_paginate
class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy]

  helper :home

WillPaginateRenderers.pagination_options[:twitter_label] = "Carregar mais" #render twitter pagination

WillPaginateRenderers.pagination_options[:twitter_class] = "buttom_twitter" #render twitter pagination


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
      @product = get_product(@offer.product.id)

      @oldprice = @product.price

      @youngprice = @offer.priceproduct

      @downloads = has_downloaded(@offer.id)

      @rest = rest(@offer.id)

      @address = AddressEstablishment.where(establishment_id: @offer.establishment.id).first

      @cupons = offer_suggestions.paginate(page: params[:page], per_page: 3)

      #notes
      @note = Note.where("offer_id = ?", @offer).last
      @rule = Rule.where("offer_id = ?", @offer).last

      @feedimages = ImageEstablishment.where("establishment_id = ?", @offer.establishment_id)

      # inserir como oferta visitada
      VisitedOffer.create(
        user_id: current_user.id,
        offer_id: @offer.id,
        category_establishments_id: @offer.establishment.category_establishment.id
      )

    else
      redirect_to new_user_session_path
    end # validando usuario logado para visualizar cupom
  end

  def get_product(product_id)
    @product = Product.find(product_id)
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

    def has_downloaded(offer_id)
      @qtde = Download.where("offer_id = ?", offer_id).count()
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_offer
      @offer = Offer.find(params[:id])
    end

    def offer_suggestions
    if current_user.visited_offers.empty?
      Offer.all
    else
      Offer.suggestions_by_category_establishments(current_user)
    end
    end

    def rest(offer_id)
      @offer = Offer.find(offer_id)
      @qtde = Download.where("offer_id = ?", offer_id).count()

      @calc = @offer.amount - @qtde
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def offer_params
      params.require(:offer).permit(:name, :description, :establishment_id, :product_id, :amount, :validity, :date, :image1, :image2, :image3, :image4, :status, :priceproduct)
    end
end
