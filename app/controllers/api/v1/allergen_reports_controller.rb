class Api::V1::AllergenReportsController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }
  before_action :authenticate_user!

  def index
    zip = current_user.zip_code
    render json: zip.allergen_reports.all
  end
end