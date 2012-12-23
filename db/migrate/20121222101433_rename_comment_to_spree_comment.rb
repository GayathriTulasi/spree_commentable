class RenameCommentToSpreeComment < ActiveRecord::Migration
  def change
    rename_table :comments,              :spree_comments
    rename_index :spree_comments, 'index_comments_on_resource_id', 'index_spree_comments_on_resource_id'
  end
end
