class Artist < ApplicationRecord
  has_many :albums, dependent: :destroy
  has_many :songs, dependent: :destroy

  def title
    is_unknown? ? I18n.t('text.unknown_artist') : name
  end

  def has_image?
    image.file.present?
  end

  def is_unknown?
    name.blank?
  end

  def need_attach_from_discogs?
    Setting.discogs_token.present? && !has_image? && !is_unknown?
  end
end
