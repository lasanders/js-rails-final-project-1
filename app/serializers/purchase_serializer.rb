class PurchaseSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :candy_id
end
