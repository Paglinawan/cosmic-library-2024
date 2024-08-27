module Taggable
  extend ActiveSupport::Concern

  class_methods do
    def set_taggable_options(tag_class:, tag_param_key:)
      @tag_class = tag_class
      @tag_param_key = tag_param_key
    end

    def tag_class
      @tag_class
    end

    def tag_param_key
      @tag_param_key
    end
  end

  included do
    before_action :set_tags_and_selected_tags, only: [:index, :new]
  end

  private

  def set_tags_and_selected_tags
    @tags = self.class.tag_class.all.pluck(:label, :label_en, :id)
    @selected_tags = params[self.class.tag_param_key] || []
  end
end
