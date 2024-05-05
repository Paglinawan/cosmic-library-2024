class FilmsController < ApplicationController
  def index
    @films = Film.all.order(created_at: :desc)
    @pagy, @films = pagy(@films, items: 6)
  end

  def new
    @is_modal_open = true
    @film = Film.new
  end

  def create
    @film = Film.new(film_params)
    if @film.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @is_modal_open = true
    @film = Film.find(params[:id])
  end

  def update
    @film = Film.find(params[:id])
    if @film.update(film_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @film = Film.find(params[:id])
    @film.destroy
    redirect_to root_path
  end

  private

  def film_params
    params.require(:film).permit(:title, :title_en, :review_star, :comment)
  end
end
