class Api::V1::SymptomReportsController < ApplicationController
require_relative '../../../models/assemble_user_data.rb'
  protect_from_forgery unless: -> { request.format.json? }
  before_action :authenticate_user!
  
  def index
    assemble_user_data(current_user)
    data = DataPackage.new
    data.addDate(@dates)
    data.addTnss(@symptoms)
    data.addAllergens(@date_reports)
    render json: data
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
    elsif report.save
      reply = "Report added successfully"
    else 
      reply = report.errors.full_messages.to_sentence
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