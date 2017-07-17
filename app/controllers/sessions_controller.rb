class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:success] = "Signed with #{@user.email} account"
      redirect_to links_path
    elsif @user == nil
      flash[:danger] = "No account registered with that email. Please sign up."
      render :new
    else
      flash[:danger] = "Incorrect email and password combination."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have logged out successfully."
    redirect_to '/home'
  end

end
