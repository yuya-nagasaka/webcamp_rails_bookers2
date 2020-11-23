class UsersController < ApplicationController

  def index
    @new_book=Book.new
  end

  def show
    @new_book=Book.new
    @book = Book.find(params[:id])
    @books=Book.all
  end

  def create
    new_book = Book.new(book_params)
    new_book.user_id=current_user.id
    nbook.save
    redirect_to book_path(book.id)
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user=User.find(current_user.id)
    @user.update(user_params)
    redirect_to user_path(current_user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image,:introduction)
  end

end
