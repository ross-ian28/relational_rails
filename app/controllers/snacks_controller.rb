class SnacksController < ApplicationController
  def index
    @snacks = Snack.all
  end

  def show
    @snack = Snack.find(params[:id])
  end

  def edit
    @snack = Snack.find(params[:id])
  end

  def update
    @snack = Snack.find(params[:id])
    @snack.update(snack_params)
    redirect_to "/snacks/#{@snack.id}"
  end

  def destroy
    @snack = Snack.find(params[:id])
    @snack.destroy
    redirect_to "/snacks"
  end

  private

    def snack_params
      params.permit(:name, :ferret_safe, :count)
    end
end
