require "rails_helper"

RSpec.describe Api::V1::SymptomReportsController, type: :controller do

  let!(:test_zip) { ZipCode.create(
    zip_code: "11111"
  ) }
  let!(:test_user) { User.create (
    email: "Test@testcom",
    zip_code: "11111",
    password: "tester"
  ) }
  let!(:first_symptom_report) { SymptomReport.create(
    sneezing: 0,
    congestion: 0,
    runny_nose: 0,
    itchy_nose: 0,
    user_id: 1,
    created_at: Date.new(2021, 11, 25),
  ) }
  let!(:second_symptom_report) { SymptomReport.create(
    sneezing: 0,
    congestion: 1,
    runny_nose: 3,
    itchy_nose: 2,
    user_id: 1,
    created_at: Date.new(2021, 11, 26),
  ) }

  describe "GETindex" do
    it "should return date and TNSS for each symptom report"

    get :index
    returned_json = JSON.parse(response.body)
    binding.pry
    end
  end
end
