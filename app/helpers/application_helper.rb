module ApplicationHelper
  def delete_confirm(name)
    { method: :delete, data: { confirm: "Are you sure you want to delete #{name}?" } }
  end

  def hero_title
    content_tag :div, class: 'hero-title' do
      content_for(:hero_title) || content_tag(:h1) { 'Descendants' }
    end
  end

  def hero_image
    content = content_for?(:hero) ? content_for(:hero) : Filler::Image.new(width: 1900, height: 1182).url
    image_tag content
  end

  def sortable_list(path, &block)
    options = { class: 'sortable', 'data-sort-url' => path }
    content_tag :ul, options do
      yield
    end
  end
end
