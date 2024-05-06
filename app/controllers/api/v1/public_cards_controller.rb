module Api
  class PublicCardsController < ApplicationController
    def update
      @is_public = params[:is_public]
      render json: { status: 'success' }
    end
  end
end