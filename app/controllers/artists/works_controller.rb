class Artists::WorksController < ApplicationController
  def index
    @artist = Artist.find(params[:id])

    if params[:sort] == "title"
      @works = @artist.works.sort_alphabetically
    elsif params[:price].present?
      # .present? asking if the price is there
      # like an include?
      @works = @artist.works.purchase_price(params[:price])
    else
      @works = @artist.works
    end
  end

  def new
    @artist = Artist.find(params[:id])
  end

  def create
    @artist = Artist.find(params[:id])
    works = @artist.works.create!(works_params)
    redirect_to "/works"
  end

  private
  def works_params
    params.permit(:title)
  end
end