class CommentsController < ApplicationController
  before_action :set_post, only: [:index, :create, :destroy]

  def index
    @comments = Comment.where(post_id: params[:post_id]).paginate(page: params[:page], per_page: 5).order(created_at: :desc)
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @comment = @post.comments.build(content: params[:comment][:content], user: current_user)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @post, notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
        flash[:error] = "Something went wrong"
      end
    end
  end

  def destroy
    byebug
    @comment = Comment.find(params[:post_id])
    @comment.destroy
    flash[:notice] = "Comment deleted"
    # redirect_to posts_path
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end

  def message_render(message)
    render(partial: "message", locals: { message: message })
  end
end
