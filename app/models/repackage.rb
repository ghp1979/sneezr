def repackage(reports)
  i = 0
  reports.each do |report|        
    @package[i] << report[:tree_value]
    i += 1
  end
  i = 0
  reports.each do |report|        
    @package[i] << report[:tree_category]
    i += 1
  end
  i = 0
  reports.each do |report|        
    @package[i] << report[:grass_value]
    i += 1
  end
  i = 0
  reports.each do |report|        
    @package[i] << report[:grass_category]
    i += 1
  end
  i = 0
  reports.each do |report|        
    @package[i] << report[:ragweed_value]
    i += 1
  end
  i = 0
  reports.each do |report|        
    @package[i] << report[:ragweed_category]
    i += 1
  end
  i = 0
  reports.each do |report|        
    @package[i] << report[:mold_value]
    i += 1
  end
  i = 0
  reports.each do |report|        
    @package[i] << report[:mold_category]
    i += 1
  end
  i = 0
  reports.each do |report|        
    @package[i] << report[:dust_dander_value]
    i += 1
  end
  i = 0
  reports.each do |report|        
    @package[i] << report[:dust_dander_category]
    i += 1
  end
end