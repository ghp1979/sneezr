def assemble_user_data(user)
  @symptoms = user.symptom_reports.all.order(:created_at)
  @dates = []
  @date_reports = []
    @symptoms.each do |report|
      @dates << report.created_at.to_date
    end
  allergens = user.zip_code.allergen_reports.order(:created_at)
    allergens.each do |report|
      @dates.each do |date|
        if report.created_at.to_date === date
          @date_reports << report
        end
      end
    end
end

