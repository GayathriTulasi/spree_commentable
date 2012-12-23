class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :city
      t.string :author
      t.text :comment
      t.string :email
      t.boolean :review, default: false
      t.boolean :approve, default: false
      t.string :resource_type
      t.integer :resource_id

      t.timestamps
    end

    add_index :comments, :resource_id
  end
end
