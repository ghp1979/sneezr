class Api::V1::SymptomReportsController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }
  before_action :authenticate_user!
  
  def index
    render json: current_user.symptom_reports.all
  end

  def create
    report = SymptomReport.new(report_params)
    latest = current_user.symptom_reports.last
    report.user = current_user  
    if latest === nil
      if report.save
        reply = "Report added successfully" 
      end
    elsif Date.today === latest.created_at.to_date
      reply ="Report already created for today"
    else 
      errors = report.errors.full_messages.to_sentence
      render json: { response: errors }
    end
    render json: { response: reply }
  end
  
  
  
  private

  def report_params
    params.require(:report).permit(:sneezing, :congestion, :runny_nose, :itchy_nose)
  end

  def authenticate_user
    if !user_signed_in?
      render json: {error: ["You need to be signed in first"]}
    end
  end

end