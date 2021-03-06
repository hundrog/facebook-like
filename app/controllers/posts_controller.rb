class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :comment_post]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @post = Post.new
    @posts = Post.paginate(page: params[:page], per_page: 5).order(created_at: :desc)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @comment = Comment.new
    @comments = Comment.where(post_id: @post.id).order(created_at: :desc).each
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user = current_user

    respond_to do |format|
      if @post.save
        format.html { redirect_to root_path, notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def new_comment
    @comment = Comment.new
  end

  def post_comment
    @comment = @post.likes.build(user: current_user)
    if @comment.save
      flash[:success] = "You have commented the post"
      # redirect_to post_path(@post)
    else
      flash[:error] = "There was something wrong"
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:content, :user_id)
  end

  def require_same_user
    if current_user != @post.user
      flash[:danger] = "You can only edit or delete your own articles"
      redirect_to root_path
    end
  end
end
