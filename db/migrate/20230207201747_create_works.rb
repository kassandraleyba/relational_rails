class CreateWorks < ActiveRecord::Migration[5.2]
  def change
    create_table :works do |t|
      t.string :title
      t.integer :price
      t.boolean :available_for_purchase
      t.string :location
      t.references :artist, foreign_key: true
      t.timestamps
    end
  end
end
