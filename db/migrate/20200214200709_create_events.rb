class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.string :location
      t.text :description
      t.belongs_to :user, index: true
      t.integer :duration
      t.datetime :start
      t.integer :price
      t.timestamps
    end
  end
end
