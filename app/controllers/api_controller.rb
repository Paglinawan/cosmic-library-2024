class ApiController < ApplicationController
  def public_cards
    is_public = params[:is_public]
    film = Film.find(params[:id]).update(is_public: is_public)
    render json: { status: 'success' }
  end
end
