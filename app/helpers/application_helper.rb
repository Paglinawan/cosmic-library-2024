module ApplicationHelper
  include Pagy::Frontend

  def pagy_nav(pagy)
    html = '<nav class="pager">'
    html += pager_prev_link(pagy)
    html += '<ul class="pager-items">'
    pagy_series(pagy).each do |n|
      html += '<li class="pager-item">'
      html += pager_link(n, pagy)
      html += '</li>'
    end
    html += '</ul>'
    html += pager_next_link(pagy)
    html += '</nav>'
    html.html_safe
  end

  def pagy_series(pagy)
    current_page = pagy.page
    total_pages = pagy.pages
    if total_pages <= 3
      (1..total_pages).to_a
    elsif current_page <= 2
      (1..3).to_a
    elsif current_page >= total_pages - 1
      (total_pages - 2..total_pages).to_a
    else
      (current_page - 1..current_page + 1).to_a
    end
  end

  def pager_link(n, pagy)
    url = url_for(request.query_parameters.merge(page: n))
    classes = ['pager-anc']
    classes << 'is-active' if n == pagy.page
    tag = n == pagy.page ? 'span' : 'a'
    link_to(n.to_s, url, class: classes.join(' '), tag: tag)
  end

  def pager_prev_link(pagy)
    image_tag = image_tag('icon-pager.svg', alt: '前へ', width: 32, height: 32)
    if pagy.prev
      url = url_for(request.query_parameters.merge(page: pagy.prev))
      link_to(image_tag, url, class: 'pager-prev is-active')
    else
      content_tag(:span, image_tag, class: 'pager-prev')
    end
  end

  def pager_next_link(pagy)
    image_tag = image_tag('icon-pager.svg', alt: '次へ', width: 32, height: 32)
    if pagy.next
      url = url_for(request.query_parameters.merge(page: pagy.next))
      link_to(image_tag, url, class: 'pager-next is-active')
    else
      content_tag(:span, image_tag, class: 'pager-next')
    end
  end
end
