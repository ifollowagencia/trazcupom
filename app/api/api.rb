class API < Grape::API
  prefix 'api'
  logger Rails.logger
  format :json
  default_error_formatter :json

  mount Resources::Sync

end
