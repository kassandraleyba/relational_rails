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

  def artist_params
    params.permit(:name, :city, :alive_today)
  end

  def edit
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
end


# integration tests for controllers