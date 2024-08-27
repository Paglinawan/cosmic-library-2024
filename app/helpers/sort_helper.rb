module SortHelper
  def render_sort_form(url:, sort_options:, sort_by_options:, selected_sort_by:, submit_text:)
    form_with url: url, class: "sort-form", method: :get, local: true do
      concat(content_tag(:div, class: "sort-chips") do
        sort_options.each do |option|
          concat(content_tag(:label, class: "sort-chip-label") do
            concat check_box_tag(option[:name], option[:value], option[:checked])
            concat content_tag(:span, option[:label], class: "sort-chip-txt")
          end)
        end
      end)

      concat(content_tag(:div, class: "sort-btm") do
        concat select_tag(:sort_by, options_for_select(sort_by_options, selected_sort_by), class: "sort-select")
        concat hidden_field_tag(:commit, 'sort')
        concat button_tag(submit_text, class: 'sort-btn', type: 'submit')
      end)
    end
  end
  def render_tags(sort_options:)
    content_tag(:div, class: "sort-chips") do
      sort_options.each do |option|
        concat(content_tag(:label, class: "sort-chip-label") do
          concat check_box_tag(option[:name], option[:value], option[:checked])
          concat content_tag(:span, option[:label], class: "sort-chip-txt")
        end)
      end
    end
  end 
end
