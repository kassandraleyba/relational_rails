class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def show
    require 'pry'; binding.pry
    # @artist = Artist.find(params[:id])
  end
end
# integration tests for controllers