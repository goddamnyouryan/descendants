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
    if content_for?(:hero)
      image_tag(content_for(:hero))
    else
      random = (1..4).to_a.sample
      image_tag("/bg-filler-#{random}.jpg")
    end
  end
end
