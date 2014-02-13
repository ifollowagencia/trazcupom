class AuthenticationTokenManager

  attr_accessor :user

  def initialize(user)
    @user = user
  end

  def generate_and_set_token
    token = generate_token_code
    return generate_token_code if duplicated?(token)
    @user.update_attribute(:authentication_token, token)
  end

  def valid?
    @user.valid?
  end

  private

    def generate_token_code( len = 60 )
      chars = (('a'..'z').to_a + ('1'..'9').to_a )- %w(i o 0 1 l 0)
      newpass = Array.new(len, '').collect{ chars[rand(chars.size)] }.join
    end

    def duplicated?(token)
      !User.where(authentication_token: token).first.nil?
    end
end
