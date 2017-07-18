class LinksController < ApplicationController

  def index
    if current_user
      @links = current_user.links
    else
      redirect_to '/home'
    end
    @link = Link.new
  end

  def new
  end

  def create
    @user = current_user
    @link = @user.links.create(link_params)

    if @link.save
      render partial: 'links/link', locals: {link: @link}, layout: false
    else
      render :new
    end

  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    if link_params.include?(:title || :url)
      @link = Link.find(params[:id])
      @link.update(link_params)

      if @link.save
        flash[:success] = "#{@link.title} has been updated."
        redirect_to links_path
      else
        flash[:danger] = "Something went wrong. Try again."
        render :edit
      end

    else
      if @link.save
        render partial: 'links/link', locals: {link: @link}, layout: false
      else
        render :new
      end
    end
  end

  private

  def link_params
    params.require(:link).permit(:title, :url, :read, :user_id)

  end

end
