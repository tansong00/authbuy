class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.integer :type_id
      t.string :key_word
      t.string :author
      t.string :origin
      t.text :content
      t.timestamps
    end
  end
end
