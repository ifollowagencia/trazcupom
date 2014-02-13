module Helpers
  module ApiHelper
    def authenticate!
       error!({message: 'Unauthorized'}, 401) if params[:authentication_token].blank?
       @user = User.find_by_authentication_token(params[:authentication_token])
       error!({message: 'Unauthorized'}, 401) unless @user
    end
  end
end
