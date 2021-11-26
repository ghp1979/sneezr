require_relative './access_api'
require './config/environment'
require_relative './allergen_report'
require_relative './application_record'
require_relative '../../config/application'

def create_allergen_report_record(zip_code)
  get_pollen_index(zip_code)
  get_dust_dander_index(zip_code)
  binding.pry
  # report = AllergenReport.new
  # report.zip_code = ZipCode.find_by zip_code: "#{zip_code}"
  # report.tree_value = @parsed_pollen[0]["Value"]
  # report.tree_category = @parsed_pollen[0]["Category"]
  # report.grass_value = @parsed_pollen[3]["Value"]
  # report.grass_category = @parsed_pollen[3]["Category"]
  # report.ragwee_value = @parsed_pollen[1]["Value"]
  # report.ragweed_category = @parsed_pollen[1]["Category"]
  # report.mold_value = @parsed_pollen[2]["Value"]
  # report.mold_category = @parsed_pollen[2]["Category"]
  # report.dust_dander_value = @parsed_dust[0]["Value"]
  # report.dust_dander_category = @parsed_dust[0]["Category"]
  # report.save
end

create_allergen_report_record(93312)