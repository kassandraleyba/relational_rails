class ArtistsController < ApplicationController
  def index
    @artists = Artist.order(created_at: :desc)
    # require 'pry'; binding.pry
  end

  def show
    @artist = Artist.find(params[:id])
  end
end
# integration tests for controllers