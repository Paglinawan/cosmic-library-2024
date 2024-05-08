module Api::V1
  class PublicFilmsController < ApplicationController
    def update
      Film.find(params[:id]).update(is_public: params[:is_public])
      render json: { status: 'success' }
    end
  end
end
