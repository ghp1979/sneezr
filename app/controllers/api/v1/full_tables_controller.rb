class Api::V1::FullTablesController < ApplicationController
  require_relative '../../../models/assemble_user_data.rb'
  require_relative '../../../models/repackage.rb'
    protect_from_forgery unless: -> { request.format.json? }
    before_action :authenticate_user!
    
    def index
      @package = []
      assemble_user_data(current_user)
      @dates.each do |date|
        @package << [date]
      end
      i = 0
      @symptoms.each do |symptom|        
        @package[i] << (symptom[:sneezing] + symptom[:congestion] + 
        symptom[:runny_nose] + symptom[:itchy_nose])
        i += 1
      end
      repackage(@date_reports)
      render json: @package
    end
  end