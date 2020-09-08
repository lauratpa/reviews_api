class ApplicationController < ActionController::API
  def authenticate
    api_key = request.headers["X-Api-Key"]
    match = Rails.application.credentials.api_secret == api_key

    return true if match
    return true if Rails.env.development?

    head :unauthorized
    false
  end
end
