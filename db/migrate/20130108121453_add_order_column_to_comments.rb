class AddOrderColumnToComments < ActiveRecord::Migration
  def change
    add_column :spree_comments, :order, :integer
  end
end
