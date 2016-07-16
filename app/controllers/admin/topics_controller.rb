class Admin::TopicsController < Admin::BaseController
  before_action :require_login

  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
    @visuals = @topic.visuals.build
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      @topic.update(display_name: SecureRandom.hex(10))
      create_tags
      redirect_to admin_topic_path(@topic)
    else
      flash[:error] = @topic.errors.full_messages.first
      render :action => 'new'
    end
  end

  def show
    @topic = Topic.find_by(display_name: params[:display_name])
  end

  def edit
    @topic = Topic.find_by(display_name: params[:display_name])
  end

  def update
    @topic = Topic.find_by(display_name: params[:display_name])
    # if @topic.update(password: params[:password], password_confirmation: params[:password_confirmation], role: params[:role])
    #   flash[:success] = "User #{@user.username.split.map(&:capitalize).join(' ')} was updated successfully."
    #   redirect_to admin_user_path(@user)
    # else
    #   flash[:error] = @user.errors.full_messages.first
    #   redirect_to edit_admin_user_path(@user)
    # end
  end

  def destroy
    topic = Topic.find_by(display_name: params[:display_name])
    topic.tags.clear
    topic.visuals.clear
    topic.descriptions.clear
    topic.destroy
    flash[:success] = "Topic deleted!"
    redirect_to admin_topics_path
  end

private
  def create_tags
    tags = params[:topic][:tags]
    tags.each do |tag_id|
      if tag_id != ""
        @topic.tags << Tag.find_by(id: tag_id)
      end
    end
  end


  def topic_params
    params.require(:topic).permit(:title, :report_date, :intro, :conclusion, { visuals_attributes: [:id, :link, :caption, :description]})
  end
end
