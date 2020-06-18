class Song < ApplicationRecord
  belongs_to :album, touch: true
  belongs_to :artist, touch: true
  has_and_belongs_to_many :playlists

  validates :name, :file_path, :md5_hash, presence: true
end
