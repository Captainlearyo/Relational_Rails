class DirectorsController < ApplicationController
  def index
    @directors = Director.order("created_at desc")
  end

  def show
    @director = Director.find(params[:id])
  end


end