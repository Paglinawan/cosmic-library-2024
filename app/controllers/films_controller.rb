class FilmsController < ApplicationController
  include Authenticatable
  include Authorization
  include Filterable
  include Sortable
  include Paginatable

  def index
    @tags = FilmTag.all.pluck(:label, :id)
    @selected_tags = params[:film_tag_ids] || []
    @records = apply_filters(Film, filter_params, tag_type: :film_tags)
    
    apply_sorting(params[:sort_by])
    apply_pagination(6)
    
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

  private

  def filter_params
    {
      tags: @selected_tags,
      is_classic: params[:is_classic] == "true",
      is_favorite: params[:is_favorite] == "true"
    }
  end
end
