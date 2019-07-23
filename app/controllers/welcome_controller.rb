class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    redirect_to posts_path if current_user
  end
end
