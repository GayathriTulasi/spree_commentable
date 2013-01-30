class AddTitleToSpreeComment < ActiveRecord::Migration
  def change
    add_column :spree_comments, :title, :string
  end
end
