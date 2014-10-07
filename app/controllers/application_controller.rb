class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :cors_set_access_control_headers
  skip_before_filter :verify_authenticity_token

  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
  end
end
