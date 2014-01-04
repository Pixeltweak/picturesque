module PhotosHelper
  def photo_thumb(picture)
    link_to image_tag(picture.image.url(:thumb)), picture, class: 'user-photo'
  end

  def photo_tile(picture)
    link_to image_tag(picture.image.url(:tile)), picture, class: 'user-photo tiled-photo'
  end
end
