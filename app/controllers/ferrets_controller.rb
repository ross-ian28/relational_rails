class FerretsController < ApplicationController
  def index
    @ferrets = Ferret.all
  end

  def show
    @ferret = Ferret.find(params[:id])
  end

  def new
  end

  def edit
    @ferret = Ferret.find(params[:id])
  end

  def create
    @ferret = Ferret.create!(ferret_params)
    redirect_to "/ferrets"
  end

  def update
    @ferret = Ferret.find(params[:id])
    @ferret.update(ferret_params)
    redirect_to "/ferrets/#{@ferret.id}"
  end

  private

    def ferret_params
      params.permit(:name, :hungry, :snack_count)
    end
end
