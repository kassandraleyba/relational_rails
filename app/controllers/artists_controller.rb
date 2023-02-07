class ArtistsController < ApplicationController
  def index
    @artists = Artist.sort
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

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    artist = Artist.find(params[:id])

    artist.update(artist_params)
    redirect_to "/artists/#{artist.id}"
  end

  def destroy
    artist = Artist.find(params[:id])
    artist.destroy

    redirect_to '/artists'
  end

  private
  def artist_params
    params.permit(:name, :city, :alive_today)
  end

end


# def update
#   @artists = Artist.find(params[:id])
#   # require 'pry'; binding.pry
#   @artists.update({
#     # require 'pry'; binding.pry
#     name: params[:artists][:name],
#     city: params[:artists][:city],
#     alive_today: params[:artists][:alive_today],
#     })
#   @artist.save
#   redirect_to "/artists/#{artist.id}"
# end


# integration tests for controllers