class ZipCodeSerializer < ActiveModel::Serializer
  attributes :id, :zip_code
  has_many :allergen_reports
end
