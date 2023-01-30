class CreateSong < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.datetime :created_at
      t.datetime :updated_at
      t.string :title
      t.boolean :top_40
      t.references :artist_id
    end
  end
end
