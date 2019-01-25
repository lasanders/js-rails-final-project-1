class CandySerializer < ActiveModel::Serializer
  attributes :id, :name, :taste, :cost, :appetite, :count

  has_many :purchases
  has_many :users, through: :purchases
  # has_many :comments, through: :users
end
