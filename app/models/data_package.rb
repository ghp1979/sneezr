class DataPackage
  attr_accessor :date, :tnss, :tree_value, :tree_category, :grass_value,
  :grass_category, :ragweed_value, :ragweed_category, :mold_value, :mold_category,
  :dust_dander_value, :dust_dander_category

  def initialize
    @date = []
    @tnss = []
    @tree_value = []
    @tree_category = []
    @grass_value = []
    @grass_category = []
    @ragweed_value = []
    @ragweed_category = []
    @mold_value = []
    @mold_category = []
    @dust_dander_value = []
    @dust_dander_category = []
  end

  def addDate(array)
    array.each do |created_at|
      @date << created_at
    end
  end

  def addTnss(array)
    array.each do |report|
      total = (report.sneezing + report.congestion + report.runny_nose + report.itchy_nose)
      @tnss << total
    end
  end

  def addAllergens(array)
    array.each do |report|
      @tree_value << report.tree_value
      @tree_category << report.tree_category
      @grass_value << report.grass_value
      @grass_category << report.grass_category
      @ragweed_value << report.ragweed_value
      @ragweed_category << report.ragweed_category
      @mold_value << report.mold_value
      @mold_category << report.mold_category
      @dust_dander_value << report.dust_dander_value
      @dust_dander_category << report.dust_dander_category
   end
  end
end