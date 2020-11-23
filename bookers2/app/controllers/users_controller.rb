class UsersController < ApplicationController

  def index
    @book=Book.new
  end

  def show
    @book=Book.new
    @books=Book.all
  end

  def create
    book = Book.new(book_params)
    book.user_id=current_user.id
    book.save
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
