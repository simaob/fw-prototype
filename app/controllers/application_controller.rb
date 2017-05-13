class ApplicationController < ActionController::Base
  include AuthHelper

  protect_from_forgery with: :exception

  before_action :set_current_user

  private

  def set_current_user
    @current_user = session[:current_user] || nil
  end

  def authenticate
    unless ensure_logged_in
      redirect_to_api_gateway_login and return
    end
  end

  def set_connection
    @conn ||= Faraday.new(:url => ENV.fetch("API_URL")) do |faraday|
      faraday.request :url_encoded
      faraday.response :logger, Rails.logger
      faraday.adapter Faraday.default_adapter
    end
  end
end
