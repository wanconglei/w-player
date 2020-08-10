class ApplicationController < ActionController::Base
  include SessionsHelper

  before_action :find_current_user

  def browser
    @browser ||= Browser.new(
      request.headers['User-Agent'],
      accept_language: request.headers['Accept-Language']
    )
  end

  def is_safari?
    browser.safari? || browser.core_media?
  end

  private

    def find_current_user
      Current.user = User.find_by(id: session[:user_id])
    end

    def require_login
      redirect_to new_session_path unless logged_in?
    end

    def require_admin
      raise MusicError::Forbidden unless is_admin?
    end
end
