class FerretSnacksController < ApplicationController
  def index
    @ferret = Ferret.find(params[:ferret_id])
  end

  def new
    @ferret = Ferret.find(params[:ferret_id])
  end

  def create
    @ferret = Ferret.find(params[:ferret_id])
    @snack = @ferret.snacks.create!(snack_params)
    redirect_to "/snacks"
  end

  private

    def snack_params
      params.permit(:name, :ferret_safe, :count)
    end
end
