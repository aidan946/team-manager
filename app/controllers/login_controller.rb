# frozen_string_literal: true

class LoginController < ApplicationController
  skip_before_action :authenticate_user!
  layout 'login'

  def new; end

  def login
    user = User.find_by(email: params[:email])
    if user&.valid_password?(params[:password])
      sign_in user
      redirect_to dashboard_path
    else
      flash[:error] = 'Invalid email or password'
      redirect_to root_path
    end
  end

  def register; end

  def create_account
    user = User.new(email: params[:email], username: params[:username], password: params[:password],
                    password_confirmation: params[:password])
    return unless user.save

    redirect_to root_path
  end

  def reset_password; end

  def logout
    sign_out @current_user
    redirect_to root_path
  end
end
