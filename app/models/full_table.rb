class FullTable
  attr_accessor :date, :tnss, :tree_value, :tree_category, :grass_value,
  :grass_category, :ragweed_value, :ragweed_category, :mold_value, :mold_category,
  :dust_dander_value, :dust_dander_category

  def initialize(dates, symptoms, date_reports)
    @dates = dates
    @symptoms = symptoms
    @date_reports = date_reports
    binding.pry
  end

  def addDate(array)
    array.each do |created_at|
      @date << created_at
    end
  end
end