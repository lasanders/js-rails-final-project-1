class AddCommentIdToCandies < ActiveRecord::Migration[5.2]
  def change
    add_column :candies, :comment_id, :integer
  end
end