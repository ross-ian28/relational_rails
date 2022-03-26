class FerretsController < ApplicationController
  def index
    @ferrets = Ferret.all
  end

  def show
    @ferret = Ferret.find(params[:id])
  end

  def new

  end

  def create
    @ferret = Ferret.create!(ferret_params)

    redirect_to "/ferrets"
  end

  private

    def ferret_params
      params.permit(:name, :hungry, :snack_count)
    end
end
