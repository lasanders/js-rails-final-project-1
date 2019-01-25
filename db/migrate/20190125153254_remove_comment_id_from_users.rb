class RemoveCommentIdFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :comment_id, :integer
  end
end
