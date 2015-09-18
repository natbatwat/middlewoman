# Methods defined in the helpers block are available in templates
module CustomTemplateHelpers
  def title_helper
    (data.page.title ? "#{data.page.title} — " : "") + "Middleboy Boilerplate"
  end

  # Description helper for html, facebook and twitter descriptions
  def description_helper
    (data.page.description ? "#{data.page.description}" : "The ultimate Middleman Boilerplate with SASS, COFFEE, SLIM")
  end
  
  def page_title
    current_page.data.title || data.site.title
  end

  def page_description
    current_page.data.description || data.site.description
  end

  def current_page_url
    "#{data.site.url}#{current_page.url}"
  end

  def page_url page
    "#{data.site.url}#{page.url}"
  end

  def page_twitter_card_type
    current_page.data.twitter_card_type || 'summary'
  end

  def page_image
    current_page.data.image_path || data.site.logo_image_path
  end

  # Social share URLs
  def twitter_url
    "https://twitter.com/share?text=“#{page_title}”" +
                               "&url=#{current_page_url}" +
                               "&via=#{data.site.twitter_handle}"
  end

  def facebook_url
    "https://www.facebook.com/dialog/feed?app_id=#{data.site.facebook_app_id}" +
                                          "&caption=#{page_title}" +
                                          "&picture=#{page_image}" +
                                          "&name=“#{page_title}”" +
                                          "&description=#{page_description}" +
                                          "&display=popup" +
                                          "&link=#{current_page_url}" +
                                          "&redirect_uri=#{current_page_url}"
  end

  def google_plus_url
    "https://plus.google.com/share?url=#{current_page_url}"
  end

  def linkedin_url
    "http://www.linkedin.com/shareArticle?mini=true" +
                                          "&url=#{current_page_url}" +
                                          "&title=#{page_title}" +
                                          "&summary=#{page_description}" +
                                          "&source=#{data.site.url}"
  end

  def conditional_html_tags(ie_versions, attributes={})
    # Create an array from given range that allows us to generate the code via simple iteration
    ie_versions = ie_versions.to_a.unshift(ie_versions.min - 1).push(ie_versions.max + 1)
    # Classes from user-provided String or Array are appended after the default ones
    extra_classes = attributes.delete(:class) { |key| attributes[key.to_s] }
 
    commented_html_tags = ie_versions.collect { |version|
      # A 'lt-ie' class is added for each supported IE version higher than the current one
      ie_classes  = (version+1..ie_versions.max).to_a.reverse.collect { |j| "lt-ie#{j}" }
      class_str   = ie_classes.unshift('no-js').push(extra_classes).compact.join ' '
      attr_str    = attributes.collect { |name, value| %Q[#{name.to_s}="#{value}"] }.join ' '
      html_tag    = %Q[<html class="#{class_str}"#{' ' unless attr_str.empty?}#{attr_str}>]
      # The first and last IE conditional comments are unique
      version_str = case version
        when ie_versions.min then
          "lt IE #{version + 1}"
        # Side effects in a `case` statement are rarely a good idea, but it makes sense here
        when ie_versions.max
          # This is rather crucial; the last HTML tag must be uncommented in order to be recognized
          html_tag.prepend('<!-->').concat('<!--') # Note that both methods are destructive
          "gt IE #{version - 1}"
        else "IE #{version}"
      end
      %Q[<!--[if #{version_str}]#{html_tag}<![endif]-->]
    }.flatten * $/
    # Return the output from given Slim blockm, wrapped in the code for commented HTML tags
    [commented_html_tags, yield, $/, '</html>'].join
  end

end
