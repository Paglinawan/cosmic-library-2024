module Authorization
  extend ActiveSupport::Concern

  included do
    before_action :check_owner, only: [:create, :update, :destroy]
  end

  private

  def check_owner
    unless @is_signed_owner
      flash[:alert] = case params[:action]
                      when 'create'
                        "作成する権限がありません"
                      when 'update'
                        "編集する権限がありません"
                      when 'destroy'
                        "削除する権限がありません"
                      else
                        "更新する権限がありません"
                      end
      redirect_to root_path
    end
  end
end
