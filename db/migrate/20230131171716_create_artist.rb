class CreateArtist < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :city
      t.boolean :alive_today
      t.timestamps
    end
  end
end
