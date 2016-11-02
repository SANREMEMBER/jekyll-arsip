# coding: utf-8
# Jekyll - Easy Archive.org Embed
#
# Una forma sencilla de insertar vídeos, audios y listas de audios de Archive.org
# Un fork basado en "Easy Youtube Embed" de Katie Harron - https://github.com/pibby
#
#   Uso:
#     Insertar un vídeo: {% archive_video VIDEO_ID %}
#     Insertar un audio: {% archive_audio AUDIO_ID %}
#     Insertar una lista de audio: {% archive_list AUDIO_LIST_ID %}
#
########################
# CSS responsive
# código a añadir en archivo css
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

  # Lookup allows access to the page/post variables through the tag context
  # def lookup(context, name)
  #  lookup = context
  #  name.split(".").each { |value| lookup = lookup[value] }
  #  lookup
  # end

  def render(context)

    # Accessing the page/site variable for the base url
    archive = "https://archive.org/download"

    # Reading the tag parameter (using the pipe-split technique)
    input_split = split_params(@input)    
    img_path = input_split[0].strip.downcase
    # Caption is an optional second parameter
    if( input_split.length > 1 )
      caption = input_split[1].strip
    end

    # Create the HTML output for the image container with an optional caption
    # the 'captioned-image' css class controls the look and feel of the image
    # in my case the class centeres the image and poses maximum size restrictions
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

Liquid::Template.register_tag('archive_video', Jekyll::Archive_video)
Liquid::Template.register_tag('archive_audio', Jekyll::Archive_audio)
Liquid::Template.register_tag('archive_list', Jekyll::Archive_list)
Liquid::Template.register_tag('archive_image', Jekyll::Archive_image)
