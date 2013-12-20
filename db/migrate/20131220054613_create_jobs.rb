class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string     :title
      t.text     :responsibility
      t.text     :qualification
      t.string   :location
      t.string  :wage
      t.string  :amount
      t.string  :other
      t.timestamps
    end
  end
end
