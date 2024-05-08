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
    @book = book.new
    @tags = Tag.all.pluck(:label, :id)
  end

  def create
    @book = book.new(book_params)
    if @book.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @is_modal_open = true
    @book = book.find(params[:id])
    @tags = Tag.all.pluck(:label, :id)
  end

  def update
    @book = book.find(params[:id])
    if @book.update(book_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @book = book.find(params[:id])
    @book.destroy
    redirect_to root_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :review_star, :comment, :book_tag_ids => [])
  end

  def set_signed_in_status
    @is_signed = user_signed_in?
  end
end
