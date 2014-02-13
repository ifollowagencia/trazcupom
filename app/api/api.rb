require 'helpers/api_helper'

class API < Grape::API
  prefix 'api'
  logger Rails.logger
  format :json
  default_error_formatter :json

  helpers Helpers::ApiHelper

  mount Resources::Sync
  mount Resources::Users
end
