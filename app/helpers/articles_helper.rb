module ArticlesHelper
  def url_for_image(object)
    extract_color = nil
    object.blob.open() do |file|
      image = MiniMagick::Image.open(file.path)
      image.resize "1x1"
      pixels = image.get_pixels
      extract_color = '#' + pixels[0][0].map{|p| p.to_s(16)}.join.upcase

    end
    url_for(
        object.variant(
            combine_options: {
                resize: "x300",
                gravity: "North",
                background: extract_color,
                extent: '600x600',
            }
        )
    )

  end
end
