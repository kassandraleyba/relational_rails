class Artists::WorksController < ApplicationController
  def index
    @artist = Artist.find(params[:id])
    @works = @artist.works
  end
end