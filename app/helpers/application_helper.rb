module ApplicationHelper
  def delete_confirm(name)
    { method: :delete, data: { confirm: "Are you sure you want to delete #{name}?" } }
  end

  def hero
    if content_for?(:hero)
      content_tag :section, id: 'hero' do
        content_for(:hero)
      end
    end
  end

  def column_class(count)
    count > 5 ? 'columns': ''
  end

  def sortable_list(path, &block)
    options = { class: 'sortable', 'data-sort-url' => path }
    content_tag :ul, options do
      yield
    end
  end

  def social_link_to(name, url)
    link_to name, url, target: '_blank', id: name.downcase
  end

  def feed_link(title, url)
    content_tag :span, class: 'view' do
      link_to "View on #{title}", url, target: '_blank'
    end
  end

  def feed_image_tag(image, url)
    link_to url, target: '_blank' do
      image_tag image
    end
  end
end
