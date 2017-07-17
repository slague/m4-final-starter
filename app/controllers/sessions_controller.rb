class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:success] = "Signed with #{@user.email} account"

      redirect_to links_path
    elsif @user.email == nil
      # FIX
      flash[:danger] = "Invalid "
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have logged out successfully."
    redirect_to '/home'
  end

end
