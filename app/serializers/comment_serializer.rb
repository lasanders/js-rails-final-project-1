class CommentSerializer < ActiveModel::Serializer
    attributes :name, :id, :user_id, :candy_id
    #
    belongs_to:user
    belongs_to:candy
  end