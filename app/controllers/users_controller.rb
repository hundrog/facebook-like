class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_posts = @user.posts.paginate(page: params[:page], per_page: 5)
  end
end
