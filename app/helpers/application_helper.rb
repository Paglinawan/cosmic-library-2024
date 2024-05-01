module ApplicationHelper
  include Pagy::Frontend

  def pagy_nav(pagy)
    html = '<nav class="pager">'
    html += pager_prev_link
    html += '<ul class="pager-items">'
    pagy.series.take(3).each do |n|
      html += '<li class="pager-item">'
      html += pager_link(n)
      html += '</li>'
    end
    html += '</ul>'
    html += pager_next_link
    html += '</nav>'
    html.html_safe
  end
  
  def pager_link(n)
    url = url_for(request.query_parameters.merge(page: n))
    classes = ['pager-anc']
    classes << 'is-active' if n == @pagy.page.to_s
    link_to(n.to_s, url, class: classes.join(' '))
  end

  def pager_prev_link
    image_tag = image_tag('icon-pager.svg', alt: '前へ', width: 32, height: 32)
    url = url_for(request.query_parameters.merge(page: @pagy.prev))
    link_to(image_tag, url, class: 'pager-prev')
  end
  
  def pager_next_link
    image_tag = image_tag('icon-pager.svg', alt: '次へ', width: 32, height: 32)
    url = url_for(request.query_parameters.merge(page: @pagy.next))
    link_to(image_tag, url, class: 'pager-next')
  end
end
