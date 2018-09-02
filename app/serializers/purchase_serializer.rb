class PurchaseSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :candy_id
  #
  belongs_to:user
  belongs_to:candy
end
