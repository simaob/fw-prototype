class ReportsController < ApplicationController
  before_action :authenticate
  before_action :set_connection

  def index
    res = @conn.get do |req|
      req.url '/questionnaire'
      req.headers['Authorization'] = "Bearer #{session[:user_token]}"
      req.headers['Content-Type'] = 'application/json'
    end
    @reports = JSON.parse(res.body)["data"]
  end

  def show
    res = @conn.get do |req|
      req.url "/questionnaire/#{params[:id]}/answer"
      req.headers['Authorization'] = "Bearer #{session[:user_token]}"
      req.headers['Content-Type'] = 'application/json'
    end
    @report = JSON.parse(res.body)["data"]
  end
end
