class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email(params[:email])

    if @user && @user.authenticate(params[:password])
      login(@user)
      redirect_to categories_path
    else
      render login_path
    end
  end

  def destroy
    logout
    redirect_to login_path
  end
end
