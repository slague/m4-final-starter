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
    else
      flash[:danger] = "#{@user.errors.messages}"
      render :new
    end

  end


  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
