class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.integer :category_id
      t.decimal :price
      t.string :description
      t.timestamps
    end
  end
end
