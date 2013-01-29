class RemoveReviewColumnFromSpreeComments < ActiveRecord::Migration
  def change
    remove_column :spree_comments, :review
  end
end
