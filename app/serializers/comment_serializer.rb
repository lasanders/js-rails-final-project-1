class CommentSerializer < ActiveModel::Serializer
    attributes :id, :name, :user_id, :candy_id
    #
    belongs_to:user
    belongs_to:candy
  end