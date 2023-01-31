class CreateWorks < ActiveRecord::Migration[5.2]
  def change
    create_table :works do |t|
      t.datetime :created_at
      t.datetime :updated_at
      t.string :title
      t.boolean :available_for_purchase
      t.references :artists, index: true, foreign_key: true
    end
  end
end
