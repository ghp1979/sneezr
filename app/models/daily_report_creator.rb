require_relative './access_api'
require_relative './allergen_report'
require_relative './zip_code.rb'
require_relative './create_allergen_report.rb'

def daily_report_creator
  zips = ZipCode.first(15)
  zips.each do |zip_code|
    create_allergen_report_record(zip_code.zip_code)
  end
end

daily_report_creator()