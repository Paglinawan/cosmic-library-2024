class BooksController < ApplicationController
  include Authenticatable
  include Authorization

  def index
    @tags = BookTag.all.pluck(:label, :id)
    @selected_tags = params[:book_tag_ids] || []
  
    if @is_signed
      @books = Book.all
    else
      @books = Book.where(is_public: true)
    end
  
    if @selected_tags.any?
      @books = @books.joins(:book_tags).where(book_tags: { id: @selected_tags }).distinct
    end

    if params[:is_classic] == "true"
      @books = @books.where(is_classic: true)
    end
    
    if params[:is_favorite] == "true"
      @books = @books.where(is_favorite: true)
    end
  
    case params[:sort_by]
    when 'review_star_desc'
      @books = @books.order(review_star: :desc, id: :asc)
    when 'review_star_asc'
      @books = @books.order(review_star: :asc, id: :asc)
    when 'created_at_asc'
      @books = @books.order(created_at: :asc, id: :asc)
    else
      @books = @books.order(created_at: :desc, id: :asc)
    end
  
    @page_count_total = @books.count
  
    @pagy, @books = pagy(@books, items: 6)
    
    if @pagy.page == @pagy.last
      @page_count_active_width = 100
    else
      @page_count_active_width = (@books.size * @pagy.page) / @page_count_total.to_f * 100
    end
  end

  def new
    @is_modal_open = true
    @is_anime = true
    @book = Book.new
    @tags = BookTag.all.pluck(:label, :id)
  end

  def create
    @is_anime = false
    @book = Book.new(book_params)
    @tags = BookTag.all.pluck(:label, :id)
    
    if @book.save
      flash[:notice] = '作成されました'
      redirect_to books_path
    else
      flash.now[:alert] = 'エラーが発生しました'
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @is_anime = true
    @is_modal_open = true
    @book = Book.find(params[:id])
    @tags = BookTag.all.pluck(:label, :id)
    @selected_tags = @book.book_tags.pluck(:id)
    session[:return_to] = request.referer
  end

  def update
    @is_anime = false
    @book = Book.find(params[:id])
    @tags = BookTag.all.pluck(:label, :id)
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

  private

  def book_params
    params.require(:book).permit(:title, :author, :review_star, :comment, :is_classic, :is_favorite).merge(is_public: 0).merge(book_tag_ids: params[:book_tag_ids])
  end
end
