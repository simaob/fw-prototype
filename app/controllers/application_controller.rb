class ApplicationController < ActionController::Base
  include AuthHelper

  protect_from_forgery with: :exception

  before_action :set_current_user

  private

  def set_current_user
    @current_user = session[:current_user] || nil
  end
end
