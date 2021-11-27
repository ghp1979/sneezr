class SymptomReport < ApplicationRecord
  validates :sneezing, numericality: true, inclusion: { in: [0, 1, 2, 3]}
  validates :congestion, numericality: true, inclusion: { in: [0, 1, 2, 3]}
  validates :runny_nose, numericality: true, inclusion: { in: [0, 1, 2, 3]}
  validates :itchy_nose, numericality: true, inclusion: { in: [0, 1, 2, 3]}
  belongs_to :user
end