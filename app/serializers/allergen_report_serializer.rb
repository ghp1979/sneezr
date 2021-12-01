class AllergenReportSerializer < ActiveModel::Serializer
  attributes :id, :tree_value, :tree_category, :grass_value, :grass_category,
  :ragweed_value, :ragweed_category, :mold_value, :mold_category,
  :dust_dander_value, :dust_dander_category, :created_at
end
