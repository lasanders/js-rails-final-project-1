class CandySerializer < ActiveModel::Serializer
  attributes :id, :name, :taste, :cost, :appetite, :count, :comment_contents

  has_many :purchases
  has_many :users, through: :purchases
end
