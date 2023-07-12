class Directors::MoviesController < ApplicationController

  def index
      @director = Director.find(params[:id])
  end
end