class CreateComments < ActiveRecord::Migration
  def change
    create_table :spree_comments do |t|
      t.string :author
      t.text :comment
      t.string :email
      t.boolean :approve, default: false
      t.references :product

      t.timestamps
    end

    add_index :spree_comments, :product_id
  end
end