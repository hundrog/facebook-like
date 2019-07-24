class LikesController < ApplicationController
  before_action :set_post, only: [:create, :destroy]

  def create
    @like = @post.likes.build(user: current_user)
    if @like.save
      flash[:success] = "Liked"
      # redirect_to post_path(@post)
    else
      flash[:error] = "Post: #{@post.id} - User: #{current_user.id}"
    end
  end

  def destroy
    @like = @post.likes.where(user_id: current_user).first
    @like.destroy
    flash[:notice] = "Unliked"
    # redirect_to posts_path
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def message_render(message)
    render(partial: "message", locals: { message: message })
  end
end
