module HomeHelper

  def get_discount(cupom_id)
      @offer = Offer.find(cupom_id)
      #pegar o produto anunciado nessa oferta
      #@product = getproduct(@offer.product.id)

        @product = Product.find(@offer.product.id)

        @oldprice = @product.price

        @youngprice = @offer.priceproduct

      # Algoritmo para calcular a porcentagem de desconto , na verdade calcular uma porcentagem mais veloz

        @mult = @youngprice * 100.0
        @div = @mult / @oldprice
        @porcentagem = 100.0 - @div
  end

  def getproduct(idproduct)
    @product = Product.find(idproduct)
  end

end
