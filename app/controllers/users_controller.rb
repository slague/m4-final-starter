class UsersController < ApplicationController

  def  new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.save
      flash[:success] = "Successfully created accoutn with email, #{@user.email}"
      session[:user_id] = @user.id

      redirect_to links_path

    elsif User.exists?(email: @user.email)
      flash[:danger] = "Sorry, but that email has already been taken."
      render :new
    else
      # FIX
      flash[:danger] = "Password and confirmation do not match"
      render :new
    end

  end


  private
  def user_params
    params.require(:user).permit(:name, :password, :email)
  end

end
