class LikeManager

  def initialize(model, user)
    @model = model
    @user = user
    validate_params!
  end

  def perform_like
    if @model.is_a? Establishment
      LikeEstablishment.new(establishment: @model, user: @user).perform_like
    elsif @model.is_a? Offer
      LikeOffer.new(offer: @model, user: @user).perform_like
    else
      raise ArgumentError, 'this is a not valid model'
    end
  end

  def count
    @model.class.count
  end

  private

  def validate_params!
    raise ArgumentError, 'invalid model attribute' if @model.blank?
    raise ArgumentError, 'User can`t be blank' if @user.blank?
  end

end
