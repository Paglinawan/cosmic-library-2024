class FilmsController < ApplicationController
  def index
    @films = Film.all
    @pagy, @films = pagy(@films, items: 6)
  end

  def destroy
    @film = Film.find(params[:id])
    @film.destroy
    redirect_to root_path
  end
end
