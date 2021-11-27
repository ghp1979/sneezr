class Api::V1::SymptomReportsController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }
  before_action :authenticate_user!
  def create
    report = SymptomReport.new(report_params)
    report.user = current_user
    recent = SymptomReport.order(:created_at).last
    if Date.today === recent.created_at.to_date
      render json: { response: "Report already created for today"}
    elsif report.save
      render json: { response: "Report added successfully" }
    else
      errors = report.errors.full_messages.to_sentence
      render json: { response: errors }
    end
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