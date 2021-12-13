require "rails_helper"

RSpec.describe Api::V1::SymptomReportsController, type: :controller do

  describe "GETindex" do
    it "should return date and TNSS for each symptom report" do
      zip = FactoryBot.create(:zip_code)
      user = FactoryBot.create(:user, zip_code_id: zip.id)
      symptoms1 = FactoryBot.create(:symptom_report, user_id: user.id,
      created_at: Date.new(2021, 12, 7))
      symptoms2 = FactoryBot.create(:symptom_report, user_id: user.id,
      created_at: Date.new(2021, 12, 8))
      symptoms3 = FactoryBot.create(:symptom_report, user_id: user.id,
      created_at: Date.new(2021, 12, 9))
    sign_in user  
    get :index
    returned_json = JSON.parse(response.body)
    date_1 = symptoms1["created_at"]
    date_2 = symptoms2["created_at"]
    date_3 = symptoms3["created_at"]
    tnss1 = (symptoms1["sneezing"] + symptoms1["congestion"] +
    symptoms1["runny_nose"] + symptoms1["itchy_nose"])
    tnss2 = (symptoms2["sneezing"] + symptoms2["congestion"] +
    symptoms2["runny_nose"] + symptoms2["itchy_nose"])
    tnss3 = (symptoms3["sneezing"] + symptoms3["congestion"] +
    symptoms3["runny_nose"] + symptoms3["itchy_nose"])
    expect(returned_json[0][0]).to eq date_1.strftime("%F")
    expect(returned_json[1][0]).to eq date_2.strftime("%F")
    expect(returned_json[2][0]).to eq date_3.strftime("%F")
    expect(returned_json[0][1]).to eq tnss1
    expect(returned_json[1][1]).to eq tnss2
    expect(returned_json[2][1]).to eq tnss3
    end
  end

  describe "POST#create" do
    it "creates a new symptom report" do
      zip = FactoryBot.create(:zip_code)
      user = FactoryBot.create(:user, zip_code_id: zip.id)
      sign_in user
      post_json = {
        report: {
          sneezing: 1,
          congestion: 2,
          runny_nose: 0,
          itchy_nose: 1
        }
      }
      post(:create, params: post_json, format: :json)
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(returned_json["response"]).to eq "Report added successfully"
    end

    it "returns an error if the user is not signed in" do
      post_json = {
        report: {
          sneezing: 1,
          congestion: 2,
          runny_nose: 0,
          itchy_nose: 1
        }
      }
      post(:create, params: post_json, format: :json)
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 401
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(returned_json["error"]).to eq "You need to sign in or sign up before continuing."
    end

    it "informs the user if a report has already been created" do
      zip = FactoryBot.create(:zip_code)
      user = FactoryBot.create(:user, zip_code_id: zip.id)
      sign_in user
      post_json = {
        report: {
          sneezing: 1,
          congestion: 2,
          runny_nose: 0,
          itchy_nose: 1
        }
      }

      post(:create, params: post_json, format: :json)
      post(:create, params: post_json, format: :json)
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(returned_json["response"]).to eq "Report already created for today"
    end
  end
end