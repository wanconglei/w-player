class CreateAlbums < ActiveRecord::Migration[6.0]
  def change
    create_table :albums do |t|
      t.string :name
      t.string :image
      t.timestamps
      t.belongs_to :artist
      t.index :name
    end
  end
end
