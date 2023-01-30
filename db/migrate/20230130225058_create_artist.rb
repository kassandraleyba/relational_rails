class CreateArtist < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.datetime :created_at
      t.datetime :updated_at
      t.string :name
      t.string :city
      t.boolean :has_more_than_one_album
    end
  end
end
