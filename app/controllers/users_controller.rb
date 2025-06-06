class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @listings = @user.listings
  end

  def my_listings
    @listings = current_user.listings
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to about_me_path, notice: "Bio updated!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:bio)
  end
end
