class FilmsController < ApplicationController
  before_action :set_signed_in_status

  def index
    if @is_signed
      @films = Film.all.order(created_at: :desc)
    else
      @films = Film.where(is_public: true).order(created_at: :desc)
    end
    @pagy, @films = pagy(@films, items: 6)
  end

  def new
    @is_modal_open = true
    @is_anime = true
    @film = Film.new
    @tags = FilmTag.all.pluck(:label, :id)
  end

  def create
    @is_anime = false
    @film = Film.new(film_params)
    @tags = FilmTag.all.pluck(:label, :id)
    if @film.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @is_anime = true
    @is_modal_open = true
    @film = Film.find(params[:id])
    @tags = FilmTag.all.pluck(:label, :id)
  end

  def update
    @is_anime = false
    @film = Film.find(params[:id])
    @tags = FilmTag.all.pluck(:label, :id)
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
    params.require(:film).permit(:title, :title_en, :review_star, :comment, :film_tag_ids => [])
  end

  def set_signed_in_status
    @is_signed = user_signed_in?
  end
end
