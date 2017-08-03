class MagicsController < ApplicationController
  before_action :set_magic, only: [:show, :edit, :update, :destroy, :toggle_status]
  before_action :set_sidebar_topics, except: [:update, :create, :destroy, :toggle_status]
  layout "magic"
  access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all

  # GET /magics
  # GET /magics.json
  def index
    if logged_in?(:site_admin)
      @magics = Magic.recent.page(params[:page]).per(5)
    else
      @magics = Magic.published.recent.page(params[:page]).per(5)
    end
    @page_title = "My Portfolio Blog"
  end

  # GET /magics/1
  # GET /magics/1.json
  def show
    if logged_in?(:site_admin) || @blog.published?
      @magic = Magic.includes(:comments).friendly.find(params[:id])
      @comment = Comment.new
   
      @page_title = @magic.title
      @seo_keywords = @magic.body
    else
      redirect_to blogs_path, notice: "You are not authorized to access this page"
    end
  end

  # GET /magics/new
  def new
    @magic = Magic.new
  end

  # GET /magics/1/edit
  def edit
  end

  # POST /magics
  # POST /magics.json
  def create
    @magic = Magic.new(magic_params)

    respond_to do |format|
      if @magic.save
        format.html { redirect_to @magic, notice: 'Magic was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /magics/1
  # PATCH/PUT /magics/1.json
  def update
    respond_to do |format|
      if @magic.update(magic_params)
        format.html { redirect_to @magic, notice: 'Magic was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /magics/1
  # DELETE /magics/1.json
  def destroy
    @magic.destroy
    respond_to do |format|
      format.html { redirect_to magics_url, notice: 'Magic was successfully destroyed.' }
    end
  end
  
  def toggle_status
    if @magic.draft?
      @magic.published!
    elsif @magic.published?
      @magic.draft!
    end
    redirect_to magics_url, notice: 'Post status has been updated.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_magic
      @magic = Magic.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def magic_params
      params.require(:magic).permit(:title, :body, :topic_id, :status)
    end
    
    def set_sidebar_topics
      @side_bar_topics = Topic.with_blogs
    end
    
end
