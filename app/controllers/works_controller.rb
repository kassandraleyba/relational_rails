class WorksController < ApplicationController
  def index
    @works = Work.all
  end

  def show
    @work = Work.find(params[:id])
  end

  def edit
    @work = Work.find(params[:id])
  end

  def update
    @work = Work.find(params[:id])

    @work.update(works_params)
    redirect_to '/works'
  end

  private
  def works_params
    params.permit(:name, :available_for_purchase)
  end
end