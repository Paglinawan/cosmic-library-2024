class FilmsController < ApplicationController
  include Authenticatable
  include Authorization

  def index
    @tags = FilmTag.all.pluck(:label, :id)
    @selected_tags = params[:film_tag_ids] || []
  
    if @is_signed
      @films = Film.all
    else
      @films = Film.where(is_public: true)
    end
  
    if @selected_tags.any?
      @films = @films.joins(:film_tags).where(film_tags: { id: @selected_tags }).distinct
    end

    if params[:is_classic] == "true"
      @films = @films.where(is_classic: true)
    end
    
    if params[:is_favorite] == "true"
      @films = @films.where(is_favorite: true)
    end
  
    case params[:sort_by]
    when 'review_star_desc'
      @films = @films.order(review_star: :desc, id: :asc)
    when 'review_star_asc'
      @films = @films.order(review_star: :asc, id: :asc)
    when 'created_at_asc'
      @films = @films.order(created_at: :asc, id: :asc)
    else
      @films = @films.order(created_at: :desc, id: :asc)
    end

    @page_count_total = @films.count
  
    @pagy, @films = pagy(@films, items: 6)
    
    if @pagy.page == @pagy.last
      @page_count_active_width = 100
    else
      @page_count_active_width = (@films.size * @pagy.page) / @page_count_total.to_f * 100
    end
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def film_params
    params.require(:film).permit(:title, :title_en, :review_star, :comment, :is_classic, :is_favorite).merge(is_public: 0).merge(film_tag_ids: params[:film_tag_ids])
  end
end
