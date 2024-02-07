class LoginController < ApplicationController
  layout 'login'

  def index; end

  def login
    user = User.where(email: params[:email]).take
    if user.valid_password?(params[:password])
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      redirect_to root_path
    end
  end

  def sign_up; end
end
