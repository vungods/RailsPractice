# app/controllers/sessions_controller.rb
class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Đăng nhập thành công!"
    else
      flash.now[:alert] = "Email hoặc mật khẩu không đúng"
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: "Đã đăng xuất thành công!"
  end
end
