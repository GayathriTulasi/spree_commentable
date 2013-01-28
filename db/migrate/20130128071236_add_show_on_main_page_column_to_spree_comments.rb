class AddShowOnMainPageColumnToSpreeComments < ActiveRecord::Migration
  def change
    add_column :spree_comments, :show_on_main_page, :boolean
  end
end
