module ApplicationHelper
  def delete_confirm(name)
    { method: :delete, data: { confirm: "Are you sure you want to delete #{name}?" } }
  end

  def hero_title
    content_tag :div, class: 'hero-title' do
      content_for?(:hero_title) ? yield(:hero_title) : content_tag(:h1) { 'Descendants' }
    end
  end
end
