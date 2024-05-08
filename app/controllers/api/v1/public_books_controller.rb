module Api::V1
  class PublicBooksController < ApplicationController
    def update
      Book.find(params[:id]).update(is_public: params[:is_public])
      render json: { status: 'success' }
    end
  end
end
