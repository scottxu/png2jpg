require "png2jpg/version"
require 'mini_magick'

module Png2jpg
   def convert(file_path)
      result_path="~/images/"
      if !Dir.exist?(result_path)
        FileUtils.mkdir_p(result_path)
      end
      overlay_image = MiniMagick::Image.open(file_path)
      width=overlay_image[:width]
      height=overlay_image[:height]
      tmp = Tempfile.new(%W[mini_magick_ .jpg], result_path)
      `convert -size #{width}x#{height} xc:'#FFFFFF' #{tmp.path}`
      bg_img = MiniMagick::Image.new(tmp.path, tmp)
      bg_name = result_path+"bg-#{Digest::MD5.hexdigest(file_path)}.jpg"
      bg_img.write bg_name

      original_image = MiniMagick::Image.open(bg_name)
      image = original_image.composite(overlay_image) do |c|
        c.compose "Over"
        c.geometry "+0+0"
      end
      image.format "jpg"
      result_file_name=result_path+"#{Digest::MD5.hexdigest(file_path)}.jpg"
      image.write result_file_name
      return result_file_name
    end
end
