class AllergenReport < ApplicationRecord
  validates :tree_value, numericality: true, presense: true
  validates :tree_category, presense: true
  validates :grass_value, numericality: true, presense: true
  validates :grass_category, presense: true
  validates :ragweed_value, numericality: true, presense: true
  validates :ragweed_category, presense: true
  validates :mold_value, numericality: true, presense: true
  validates :mold_category, presense: true
  validates :dust_dander_value, numericality: true, presense: true
  validates :dust_dander_category, presense: true
  
  belongs_to :zip_code
end