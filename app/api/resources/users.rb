module Resources
  class Users < API

    resource :users do
      post :login do
        puts params
        user = User.find_for_database_authentication(email: params[:user][:email])
        if user.valid_password?(params[:user][:password])
          AuthenticationTokenManager.new(user).generate_and_set_token
          status(200)
          { authentication_token: user.authentication_token }
        else
          status(401)
          { message: 'Unauthorized' }
        end
      end
    end

  end
end
