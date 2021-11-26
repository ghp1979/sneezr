class ZipCode < ApplicationRecord
  validates :zip_code, length: { is: 5 }, uniqueness: true
  has_many :users
  has_many :allergen_reports
end