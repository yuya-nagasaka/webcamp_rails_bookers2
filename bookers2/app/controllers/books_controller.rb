class BooksController < ApplicationController

  def index
    @new_book=Book.new
    @books=Book.all
    @users=User.all
  end

  def create
    book = Book.new(book_params)
    book.user_id=current_user.id
    book.save
    redirect_to book_path(book.id)
  end

  def show
    @new_book=Book.new
    @book = Book.find(params[:id])
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
