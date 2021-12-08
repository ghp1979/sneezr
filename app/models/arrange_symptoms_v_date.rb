def arrange_symptoms_v_date(dates, symptom_reports)
  @package = []
  tnss = []
  @dates.each do |date|
    @package << [date]
  end
  i = 0
  @symptoms.each do |symptom|        
    @package[i] << (symptom[:sneezing] + symptom[:congestion] + 
    symptom[:runny_nose] + symptom[:itchy_nose])
    i += 1
  end
end