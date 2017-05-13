class AreasController < ApplicationController
  before_action :authenticate
  before_action :set_connection

  def index
    res = @conn.get do |req|
      req.url '/area'
      req.headers['Authorization'] = "Bearer #{session[:user_token]}"
      req.headers['Content-Type'] = 'application/json'
    end
    @areas = JSON.parse(res.body)["data"]
  end
end
