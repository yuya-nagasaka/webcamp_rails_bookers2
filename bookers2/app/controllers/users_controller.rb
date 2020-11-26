class UsersController < ApplicationController

before_action :authenticate_user!

  def index
    @book=Book.new
    @users=User.all
  end

  def show
    @new_book=Book.new
    @book = Book.find(params[:id])
    @user=User.find(params[:id])
    @books =@user.books
  end

  def create
    new_book = Book.new(book_params)
    new_book.user_id=current_user.id
    new_book.save
    redirect_to book_path(book.id)
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @new_book=Book.new
    @book = Book.find(params[:id])
    @user=User.find(params[:id])
    @books =@user.books

    if @user.update(user_params)
      flash[:success] = "successfully updated"
      redirect_to user_path(current_user.id)
    else
      flash[:danger] = "update error"
      render:show
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image,:introduction)
  end
end