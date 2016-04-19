class TagsController < ApplicationController
  before_action :require_login

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      flash[:success] = "Tag successfully created!"
      redirect_to tags_path
    else
      flash[:error] = @tag.errors.full_messages.first
      render :action => 'new'
    end
  end

  def index
    @tags = Tag.all
  end

private
  def tag_params
    params.require(:tag).permit(:name)
  end
end
