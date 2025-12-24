class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]
  layout "login"

  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Selamat datang kembali, #{user.username}!"
    else
      flash.now[:alert] = "Username atau password salah."
      render :new, status: :unauthorized
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: "Anda telah keluar."
  end
end
