class BooksController < ApplicationController

before_action :authenticate_user!

  def index
    @new_book=Book.new
    @books=Book.all
    @users=User.all
  end

  def create
    book = Book.new(book_params)
    book.user_id=current_user.id
    book.save
    redirect_to book_path(book)
  end

  def show
    @new_book=Book.new
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book=Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book)
  end

  def destroy
    book=Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
