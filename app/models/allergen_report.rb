class AllergenReport < ApplicationRecord
  validates :tree_value, numericality: true, presence: true
  validates :tree_category, presence: true
  validates :grass_value, numericality: true, presence: true
  validates :grass_category, presence: true
  validates :ragweed_value, numericality: true, presensce: true
  validates :ragweed_category, presence: true
  validates :mold_value, numericality: true, presence: true
  validates :mold_category, presence: true
  validates :dust_dander_value, numericality: true, presence: true
  validates :dust_dander_category, presence: true
  
  belongs_to :zip_code
end