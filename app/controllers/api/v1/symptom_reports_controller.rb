class Api::V1::SymptomReportsController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }
  before_action :authenticate_user!
  
  def index
    symptoms = current_user.symptom_reports.all.order(:created_at)
    dates = []
    date_reports = []
    symptoms.each do |report|
      dates << report.created_at.to_date
    end
    allergens = current_user.zip_code.allergen_reports.order(:created_at)
    allergens.each do |report|
      dates.each do |date|
        if report.created_at.to_date === date
          date_reports << report
        end
      end
    end
    table = FullTable.new(dates, symptoms, date_reports)
    data = DataPackage.new
    data.addDate(dates)
    data.addTnss(symptoms)
    data.addAllergens(date_reports)
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