class FilmsController < ApplicationController
  def index
    @films = Film.all
  end

  def destroy
    @film = Film.find(params[:id])
    @film.destroy

    redirect_to root_path
  end
end
