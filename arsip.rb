# coding: utf-8
# Jekyll Arsip - Cara Mudah Sematkan Berkas dari Archive.org
#
# Sematkan berbagai berkas video, audio, daftar audio, bahkan gambar dari Internet Archive secara mudah.
# "jekyll-arsip" dibuat berdasarkan "jekyll-archive-org" yang dibuat oleh Tarteka - https://github.com/tarteka
# "jekyll-archive-org" dibuat berdasarkan "jekyll-youtube" oleh Katie Harron - https://github.com/pibby
#
#   Penggunaan
#     Cara menyematkan vídeo: {% arsip_video ID_VIDEO %}
#     Cara menyematkan audio: {% arsip_audio ID_AUDIO %}
#     Cara menyematkan daftar audio: {% arsip_daftar ID_DAFTAR_AUDIO %}
#     Cara menyematkan gambar: {% arsip_gambar ID_GAMBAR/NAMA_BERKAS_GAMBAR|KETERANGAN BEBAS %}
#
########################
# CSS responsif
# Bersifat opsional
#
# /* responsive videos */
# .video figure {
#    position: relative;
#    nowhitespace: afterproperty;
#    padding-bottom: 56.25%;
#    height: 0;
#    overflow: hidden;
# }
#
# .video iframe, .video object, .video embed {
#    position: absolute;
#    top: 0;
#    left: 0;
#    width: 100%;
#    height: 100%;
# }
#
# .audio iframe, .audio object, .audio embed {
#    width: 100%;
# }
#

module Jekyll
  class Archive_video < Liquid::Tag
    @url = nil

    VIDEO_URL = /(\S+)/i

    def initialize(tag_name, markup, tokens)
      super

      if markup =~ VIDEO_URL
        @url = $1
      end
    end

    def render(context)
      source = "<div class=\"video\">"
      source += "<figure>"
      source += "<iframe width=\"800\" height=\"480\" src=\"//archive.org/embed/#{@url}\" frameborder=\"0\" allowfullscreen webkitallowfullscreen=\"true\" mozallowfullscreen=\"true\"></iframe>"
      source += "</figure>"
      source += "</div>"
      source
    end
  end

  class Archive_audio < Liquid::Tag
    @url = nil

    AUDIO_URL = /(\S+)/i

    def initialize(tag_name, markup, tokens)
      super

      if markup =~ AUDIO_URL
        @url = $1
      end
    end

    def render(context)
      source = "<div class=\"audio\">"
      source += "<iframe width=\"800\" height=\"30\" src=\"//archive.org/embed/#{@url}\" frameborder=\"0\" allowfullscreen webkitallowfullscreen=\"true\" mozallowfullscreen=\"true\"></iframe>"
      source += "</div>"
      source
    end
  end

  class Archive_list < Liquid::Tag
    @url = nil

    LIST_URL = /(\S+)/i

    def initialize(tag_name, markup, tokens)
      super

      if markup =~ LIST_URL
        @url = $1
      end
    end

    def render(context)
      source = "<div class=\"video\">"
      source += "<figure>"
      source += "<iframe width=\"800\" height=\"300\" src=\"//archive.org/embed/#{@url}&playlist=1\" frameborder=\"0\" allowfullscreen webkitallowfullscreen=\"true\" mozallowfullscreen=\"true\"></iframe>"
      source += "</figure>"
      source += "</div>"
      source
    end
  end


  class Archive_image < Liquid::Tag

  def initialize(tag_name, input, tokens)
    super
    @input = input
  end

  def render(context)

    archive = "https://archive.org/download"
    input_split = split_params(@input)    
    img_path = input_split[0].strip.downcase

    if( input_split.length > 1 )
      caption = input_split[1].strip
    end

    output =  "<p>"
    output += "<img src=\"#{archive}/#{img_path}\" alt=\"#{caption}\" title=\"#{caption}\" />"
    output += "</p>"

    return output    
  end

  def split_params(params)
    params.split("|")
  end
  end
  
end

Liquid::Template.register_tag('arsip_video', Jekyll::Archive_video)
Liquid::Template.register_tag('arsip_audio', Jekyll::Archive_audio)
Liquid::Template.register_tag('arsip_daftar', Jekyll::Archive_list)
Liquid::Template.register_tag('arsip_gambar', Jekyll::Archive_image)
