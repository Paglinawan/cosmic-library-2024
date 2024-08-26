module Paginatable
  extend ActiveSupport::Concern

  def apply_pagination(per_page = 9)
    @page_total = @records.count
    @pagy, @records = pagy(@records, items: per_page)
    @page_active_width = calc_active_width
  end

  private

  def calc_active_width
    return 100 if @pagy.page == @pagy.last
    ((@pagy.page - 1) * @pagy.items + @records.size).to_f / @page_total * 100
  end
end
