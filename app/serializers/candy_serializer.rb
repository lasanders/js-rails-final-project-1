class CandySerializer < ActiveModel::Serializer
  attributes :id, :name, :taste, :cost, :appetite, :count
end
