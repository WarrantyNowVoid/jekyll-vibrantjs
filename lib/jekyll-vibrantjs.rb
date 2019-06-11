require "open3"
require "jekyll"
require "jekyll-vibrantjs/version"
class VibrantJS < Liquid::Tag

  def initialize(tagName, image_arg, tokens)
    super
    @image_arg = image_arg
  end

  def render(context)
    # if we pass in something like "post.image.feature" instead of a path,
    # the variable name gets passed in as a string, so we can look it up in the context
    image_path = "#{context[@image_arg.strip]}"

    if File.exist?(image_path)
      script_path = File.expand_path('./call-vibrant.js', File.dirname(__FILE__))
      stdout, status = Open3.capture2('node', script_path, image_path)
      raise "Failed to call vibrantjs" unless status.success?
    else
      raise "Given image file `#{image_path}` doesn't exist"
    end

    @palette = eval(stdout)
    
    tmpl_path = File.join Dir.pwd, "_includes", "vibrantjs-css.html"
    unless File.exist?(tmpl_path)
      tmpl_path = File.expand_path('./vibrantjs-css.html', File.dirname(__FILE__))
    end

    tmpl = File.read tmpl_path
    site = context.registers[:site]
    tmpl = (Liquid::Template.parse tmpl).render site.site_payload.merge!({
      "rgbVibrant" => @palette["Vibrant"],
      "rgbLightVibrant" => @palette["LightVibrant"],
      "rgbDarkVibrant" => @palette["DarkVibrant"],
      "rgbMuted" => @palette["Muted"],
      "rgbLightMuted" => @palette["LightMuted"],
      "rgbDarkMuted" => @palette["DarkMuted"]
    })
  end

  Liquid::Template.register_tag "vibrantjs", self
end