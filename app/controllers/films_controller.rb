class FilmsController < ApplicationController
  include Authenticatable
  include Authorization
  include Filterable
  include Sortable
  include Paginatable

  def index
    @tags = FilmTag.all.pluck(:label, :label_en, :id)
    @selected_tags = params[:film_tag_ids] || []
    @records = apply_filters(Film, filter_params, tag_type: :film_tags)
    
    apply_sorting(params[:sort_by])
    apply_pagination(9)
    
    @films = @records.includes(:country, :film_tags)
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

  def card_en
    render_card_partial(Film, 'card_en')
  end

  def card_jp
    render_card_partial(Film, 'card_jp')
  end

  private

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
