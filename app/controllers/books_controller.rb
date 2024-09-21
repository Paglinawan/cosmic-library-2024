class BooksController < ApplicationController
  include Authenticatable
  include Authorization
  include Filterable
  include Sortable
  include Paginatable

  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]

  def index
    set_all_tags
    set_params_tags
    @records = apply_filters(Book, filter_params, tag_type: :book_tags)

    apply_sorting(params[:sort_by])
    apply_pagination(9)

    @books = @records.includes(:country, :book_tags)
  end

  def new
    set_all_tags
    @book = Book.new(year: 2000)
    set_book_tags
  end

  def create
    set_all_tags
    @book = Book.new(book_params)
    
    if @book.save
      flash[:notice] = '作成されました'
      redirect_to books_path
    else
      flash.now[:alert] = 'エラーが発生しました'
      render :new, status: :unprocessable_entity
    end

    set_book_tags
  end

  def edit
    set_all_tags

    @book = Book.find(params[:id])

    set_book_tags
  end

  def update
    set_all_tags

    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = '更新されました'
      redirect_to session.delete(:return_to) || books_path
    else
      flash.now[:alert] = 'エラーが発生しました'
      render :edit, status: :unprocessable_entity
    end

    set_book_tags
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
      :translator,
      :translator_en,
      :publisher_id,
      :quote,
      :quote_en,
      :review_star,
      :country_id,
      :year,
      :is_classic,
      :is_favorite,
    ).merge(book_tag_ids: params[:book_tag_ids])
  end
  

  def filter_params
    {
      tags: @params_tags,
      is_classic: params[:is_classic] == "true",
      is_favorite: params[:is_favorite] == "true"
    }
  end

  def render_card_partial(model_class, partial_name)
    @el = model_class.find(params[:id])
    render partial: partial_name, locals: { el: @el }
  end

  def set_all_tags
    @all_tags = BookTag.all.pluck(:label, :label_en, :id)
  end
  
  def set_params_tags
    @params_tags = params[:book_tag_ids] || []
  end

  def set_book_tags
    @book_tags = @book.book_tags.pluck(:id) || []
  end

end
