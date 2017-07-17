class UsersController < ApplicationController

  def  new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.save
      flash[:success] = "Successfully created account with email, #{@user.email}"
      session[:user_id] = @user.id

      redirect_to links_path

    elsif User.exists?(email: @user.email)
      flash[:danger] = "Sorry, but that email has already been taken."
      render :new
    elsif user_params[:email] == ""
      flash[:danger] = "You must include an email in order to register."
      render :new
    elsif user_params[:password] == ""
      flash[:danger] = "You must include a password in order to register."
      render :new
    elsif user_params[:password] != user_params[:password_confirmation]
      flash[:danger] = "Password and confirmation must match in order to register."
      render :new
    else
      flash[:danger] = "There was an error. Please try again."
      render :new
    end

  end


  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
