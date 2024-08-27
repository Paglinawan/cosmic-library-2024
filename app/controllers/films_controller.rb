class FilmsController < ApplicationController
  include Authenticatable
  include Authorization
  include Filterable
  include Sortable
  include Paginatable
  include Taggable

  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  set_taggable_options tag_class: FilmTag, tag_param_key: :film_tag_ids

  def index
    @records = apply_filters(Film, filter_params, tag_type: :film_tags)
    apply_sorting(params[:sort_by])
    apply_pagination(9)
    @films = @records.includes(:country, :film_tags)
  end

  def new
    @film = Film.new(review_star: 3)
  end

  def create
    @film = Film.new(film_params)
    if @film.save
      flash[:notice] = '作成されました'
      redirect_to films_path
    else
      flash.now[:alert] = 'エラーが発生しました'
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @film = Film.find(params[:id])
  end

  def update
    @film = Film.find(params[:id])
    if @film.update(film_params)
      flash[:notice] = '更新されました'
      redirect_to session.delete(:return_to) || films_path
    else
      flash.now[:alert] = 'エラーが発生しました'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @film = Film.find(params[:id])
    if @film.destroy
      flash[:notice] = '削除されました'
    else
      flash[:alert] = 'エラーが発生しました'
    end
    redirect_back(fallback_location: films_path)
  end

  def card_en
    render_card_partial(Film, 'card_en')
  end

  def card_jp
    render_card_partial(Film, 'card_jp')
  end

  private

  def authenticate_user!
    redirect_to root_path unless @is_signed
  end

  def film_params
    params.require(:film).permit(
      :title,
      :title_en,
      :comment,
      :comment_en,
      :director,
      :director_en,
      :cast,
      :cast_en,
      :review_star,
      :country_id,
      :year,
      :is_public,
      :is_classic,
      :is_favorite,
      film_tag_ids: []
    )
  end

  def filter_params
    {
      tags: @selected_tags,
      is_classic: params[:is_classic] == "true",
      is_favorite: params[:is_favorite] == "true"
    }
  end

  def render_card_partial(model_class, partial_name)
    @el = model_class.find(params[:id])
    render partial: partial_name, locals: { el: @el }
  end
end
