desc "Make API Call, Save Data"
task :call_api => :environment do
  daily_report_creator()
end

