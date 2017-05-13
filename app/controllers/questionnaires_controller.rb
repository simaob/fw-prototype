class QuestionnairesController < ApplicationController
  before_action :authenticate
  before_action :set_connection

  def index
    res = @conn.get do |req|
      req.url '/questionnaire'
      req.headers['Authorization'] = "Bearer #{session[:user_token]}"
      req.headers['Content-Type'] = 'application/json'
    end
    @questionnaires = JSON.parse(res.body)["data"]
  end
end
