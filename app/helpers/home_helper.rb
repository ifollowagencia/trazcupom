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

  def share_with_facebook_url(opts)

    # Generates an url that will 'share with Facebook', and can includes title, url, summary, images without need of OG data.
    #
    # URL generate will be like
    # http://www.facebook.com/sharer.php?s=100&p[title]=We also do cookies&p[url]=http://www.wealsodocookies.com&p[images][0]=http://www.wealsodocookies.com/images/logo.jpg&p[summary]=Super developer company
    #
    # For this you'll need to pass the options as
    #
    # { :url     => "http://www.wealsodocookies.com",
    #   :title   => "We also do cookies",
    #   :images  => {0 => "http://imagelink"} # You can have multiple images here
    #   :summary => "My summary here"
    # }

    url = "http://www.facebook.com/sharer.php?s=100&"

    parameters = []

    opts.each do |k,v|
      key = "p[#{k}]"

      if v.is_a? Hash
        v.each do |sk, sv|
          parameters << "#{key}[#{sk}]=#{sv}"
        end
      else
        parameters << "#{key}=#{v}"
      end

    end

    url + parameters.join("&")
   end

end
