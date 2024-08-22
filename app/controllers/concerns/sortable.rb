module Sortable
  extend ActiveSupport::Concern

  ALLOWED_SORT_COLUMNS = %w[created_at updated_at title title_en review_star is_classic is_favorite].freeze

  def apply_sorting(sort_by = :created_at, order = :desc)
    sort_by = sort_by.to_s if sort_by.is_a?(Symbol)
    order = order.to_s.downcase == 'asc' ? :asc : :desc

    if ALLOWED_SORT_COLUMNS.include?(sort_by)
      @records = @records.order(sort_by => order)
    else
      @records = @records.order(created_at: :desc)
    end
  end
end
