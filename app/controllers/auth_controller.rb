class AuthController < ApplicationController
  def login
    token = params[:token]

    redirect_to_api_gateway_login and return if token.blank?

    session[:user_token] = token

    unless ensure_logged_in
      redirect_to_api_gateway_login and return
    end

    redirect_url = session.delete(:return_to)

    if redirect_url and !is_login_redirect?(redirect_url)
      redirect_to redirect_url
    else
      redirect_to root_url
    end
  end

  def logout
    session.delete(:user_token)
    session.delete(:current_user)
    redirect_to_api_gateway_logout
  end

  private

  def is_login_redirect?(params)
    return (params[:controller].eql?('auth') && params[:action].eql?('login'))
  end
end
