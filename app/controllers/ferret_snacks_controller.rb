class FerretSnacksController < ApplicationController
  def index
    @ferret = Ferret.find(params[:ferret_id])
  end
end
