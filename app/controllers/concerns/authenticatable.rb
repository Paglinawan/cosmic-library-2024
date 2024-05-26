module Authenticatable
  extend ActiveSupport::Concern

  included do
    before_action :set_signed_in_status
  end

  private

  def set_signed_in_status
    @is_signed = user_signed_in?
    if current_user&.email == "owner@paglinawan.xsrv.jp"
      @is_signed_owner = true
    end
  end
end