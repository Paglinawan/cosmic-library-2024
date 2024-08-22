module Filterable
  extend ActiveSupport::Concern

  def apply_filters(model, params = {}, tag_type: nil)
    @records = base_scope(model)
    params.each do |key, value|
      @records = apply_filter(@records, key, value, tag_type) if value.present?
    end
    @records
  end

  private

  def base_scope(model)
    @is_signed ? model.all : model.where(is_public: true)
  end

  def apply_filter(records, key, value, tag_type)
    case key
    when :tags
      records.joins(tag_type).where(tag_type => { id: value }).distinct
    when :is_classic
      records.where(is_classic: value)
    when :is_favorite
      records.where(is_favorite: value)
    else
      records
    end
  end
end
