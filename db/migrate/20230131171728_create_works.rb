class CreateWorks < ActiveRecord::Migration[5.2]
  def change
    create_table :works do |t|
      t.string :title
      t.boolean :available_for_purchase
      t.references :artist, index: true, foreign_key: true
      t.timestamps
    end
  end
end