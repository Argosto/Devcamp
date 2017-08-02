class TopicsController < ApplicationController
  layout 'magic'

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])

    if logged_in?(:site_admin)
      @magics = @topic.magics.recent.page(params[:page]).per(5)
    else
      @magics = @topic.magics.published.recent.page(params[:page]).per(5)
    end
  end
end