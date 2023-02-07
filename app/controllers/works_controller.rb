class WorksController < ApplicationController
  def index
    if params[:sort] == "available_for_purchase"
      @works = Work.purchase_true
    else
      @works = Work.all
    end
  end

  def show
    @work = Work.find(params[:id])
  end

  def edit
    @work = Work.find(params[:id])
  end

  def update
    work = Work.find(params[:id])
    work.update(works_params)

    redirect_to "/works/#{work.id}"
  end

  def destroy
    work = Work.find(params[:id])
    work.destroy

    redirect_to '/works'
  end

  private
  def works_params
    params.permit(:name, :available_for_purchase)
  end
end