class RemoveCommentIdFromCandies < ActiveRecord::Migration[5.2]
  def change
    remove_column :candies, :comment_id, :integer
  end
end
