class BooksController < ApplicationController

before_action :authenticate_user!

before_action :correct,only: [:edit]



  def index
    @book=Book.new
    @books=Book.all
  end

  def create
    @book = Book.new(book_params)
    @books=Book.all
    @book.user_id=current_user.id
    if @book.save
       flash[:success] = "successfully posted"
       redirect_to book_path(@book)
    else
       flash[:danger] = "posting error"
       render:index
    end
  end

  def show
    @new_book=Book.new
    @book = Book.find(params[:id])
  end

  def      correct
           @book = Book.find(params[:id])
    unless @book.user.id == current_user.id
           redirect_to books_path
    end
  end


  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book=Book.find(params[:id])
    @books=Book.all
    if @book.update(book_params)
       flash[:success] = "successfully updated"
       redirect_to book_path(@book)
    else
       flash[:danger] = "updating error"
       render:index
    end
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
