module ApplicationHelper
  def delete_confirm(name)
    { method: :delete, data: { confirm: "Are you sure you want to delete #{name}?" } }
  end

  def hero_title
    if content_for?(:hero_title)
      content_tag :div, class: 'hero-title' do
        content_for(:hero_title)
      end
    end
  end

  def hero_image
    if content_for?(:hero)
      image_tag content_for(:hero)
    end
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
end
