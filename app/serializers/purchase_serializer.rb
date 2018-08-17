class PurchaseSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :candy_id, :payment_type

  belongs_to:user
  belongs_to:candy
end
