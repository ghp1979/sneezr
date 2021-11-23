require 'pry'

class Api::V1::SymptomReportsController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }

  def create
    report = SymptomReport.new(report_params)
    report.user = current_user
    if report.save
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