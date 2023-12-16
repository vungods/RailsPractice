# app/controllers/users_controller.rb
class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Đăng nhập người dùng sau khi đăng ký thành công
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Đăng ký thành công!"
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
