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
end