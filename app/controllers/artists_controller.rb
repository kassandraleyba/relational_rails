class ArtistsController < ApplicationController
  def index
    @artists = Artist.sort
    # @artists = Artist.order(created_at: :desc)
  end
  
  def show
    @artist = Artist.find(params[:id])
  end
  
  def new

  end

  def create
    artist = Artist.create!(artist_params)
    redirect_to "/artists"
  end

  def artist_params
    params.permit(:name, :city, :alive_today)
    # params for the artist form
    # helper method
  end
end
# integration tests for controllers