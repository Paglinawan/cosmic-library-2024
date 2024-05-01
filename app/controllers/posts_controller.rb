class PostsController < ApplicationController
  def index
    @films = Film.all
  end
end
