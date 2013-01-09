class RemoveOrderFromSpreeComments < ActiveRecord::Migration
  def up
    remove_column :spree_comments, :order
  end
end
