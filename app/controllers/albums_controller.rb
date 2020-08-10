class AlbumsController < ApplicationController
  include Pagy::Backend

  before_action :require_login
  before_action :find_album, except: [:index]

  def index
    records = Album.includes(:artist).order(:name)
    @pagy, @albums = pagy_countless(records)
  end

  private

    def find_album
      @album = Album.find(params[:id])
    end
end
