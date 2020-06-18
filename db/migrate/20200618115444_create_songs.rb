class CreateSongs < ActiveRecord::Migration[6.0]
  def change
    create_table :songs do |t|
      t.string :name, null: false
      t.string  :file_path, null: false
      t.string  :md5_hash, null: false
      t.float   :length, default: 0.0, null: false
      t.integer :tracknum
      t.timestamps
      t.belongs_to :album
      t.belongs_to :artist
      t.index :name
    end
  end
end
