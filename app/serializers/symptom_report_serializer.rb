class SymptomReportSerializer < ActiveModel::Serializer
  attributes :id, :sneezing, :congestion, :runny_nose, :itchy_nose, :created_at
end
