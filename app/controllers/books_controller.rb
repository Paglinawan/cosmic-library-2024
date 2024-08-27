class BooksController < ApplicationController
  include Authenticatable
  include Authorization
  include Filterable
  include Sortable
  include Paginatable
  include Taggable

  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  set_taggable_options tag_class: BookTag, tag_param_key: :book_tag_ids

  def index
    @records = apply_filters(Book, filter_params, tag_type: :book_tags)
    apply_sorting(params[:sort_by])
    apply_pagination(9)
    @books = @records.includes(:country, :book_tags)
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    
    if @book.save
      flash[:notice] = '作成されました'
      redirect_to books_path
    else
      flash.now[:alert] = 'エラーが発生しました'
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      flash[:notice] = '更新されました'
      redirect_to session.delete(:return_to) || books_path
    else
      flash.now[:alert] = 'エラーが発生しました'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      flash[:notice] = '削除されました'
    else
      flash[:alert] = 'エラーが発生しました'
    end
    redirect_back(fallback_location: books_path)
  end

  def card_en
    render_card_partial(Book, 'card_en')
  end

  def card_jp
    render_card_partial(Book, 'card_jp')
  end

  private

  def authenticate_user!
    redirect_to books_path unless @is_signed
  end

  def book_params
    params.require(:book).permit(
      :title,
      :title_en,
      :comment,
      :comment_en,
      :author,
      :author_en,
      :publisher_id,
      :quote,
      :quote_en,
      :review_star,
      :country_id,
      :year,
      :is_classic,
      :is_favorite,
      book_tag_ids: []
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
