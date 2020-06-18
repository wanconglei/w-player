class CreateJoinTablePlaylistSong < ActiveRecord::Migration[6.0]
  def change
    create_join_table :playlists, :songs do |t|
      t.index [:song_id, :playlist_id], unique: true
      t.datetime :created_at, null: false
    end
  end
end
