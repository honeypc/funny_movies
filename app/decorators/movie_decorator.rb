class MovieDecorator < ApplicationDecorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def summary
    Rumoji.decode(description)
  end

  def data
    return unless sources
    sources.deep_symbolize_keys
  end

  def thumbnails
    data.try(:[], :thumbnails)
  end

  def thumbnail(type = "medium")
    return unless thumbnails
    thumbnail = thumbnails.try(:[], type.to_sym) || { url: "images/movie.png" }
    helpers.image_tag(thumbnail[:url], thumbnail)
  end

  def user_email
    user.email
  end

  def likes
    data.try(:[], :likeCount) || 0
  end

  def dislikes
    data.try(:[], :dislikeCount) || 0
  end
end
