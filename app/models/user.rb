class User < ApplicationRecord
  AVAILABLE_THEME_OPTIONS = %w(dark light auto)
  DEFAULT_THEME = 'dark'

  include ScopedSetting

  before_create :downcase_email

  validates :email presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :password, length: { minimum: 6 }
  has_secure_password

  scoped_field :theme, default: DEFAULT_THEME, available_options: AVAILABLE_THEME_OPTIONS

  def update_settings(settings)
    settings.each do |key, value|
      send("#{key}=", value)
    end
  end

  private

  def downcase_email
    self.email = email.downcase
  end

end
