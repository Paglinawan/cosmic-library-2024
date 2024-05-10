class BooksController < ApplicationController
  before_action :set_signed_in_status

  def index
    if @is_signed
      @books = Book.all.order(created_at: :desc)
    else
      @books = Book.where(is_public: true).order(created_at: :desc)
    end
    @pagy, @books = pagy(@books, items: 6)
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
    if @book.save
      redirect_to books_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @is_anime = true
    @is_modal_open = true
    @book = Book.find(params[:id])
    @tags = BookTag.all.pluck(:label, :id)
  end

  def update
    @is_anime = false
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to books_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :review_star, :comment).merge(book_tag_ids: params[:book_tag_ids])
  end

  def set_signed_in_status
    @is_signed = user_signed_in?
  end
end
