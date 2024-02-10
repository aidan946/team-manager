class RegistrationController < ApplicationController
  skip_before_action :authenticate_user!
  layout 'login'

  def new; end

  def register; end

  def create_account
    user = User.new(email: params[:email], username: params[:username], password: params[:password],
                    password_confirmation: params[:password])
    return unless user.save

    redirect_to root_path
  end

  def logout
    sign_out @current_user
    redirect_to root_path
  end
end
