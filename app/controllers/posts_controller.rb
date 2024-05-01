class PostsController < ApplicationController
  def index
    @films = Film.all
  end

  def destroy
    @post = Film.find(params[:id])
    @post.destroy

    redirect_to root_path
  end
end
