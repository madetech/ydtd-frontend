module YdtdFrontend
  module MailerHelper
    def spacer(width, height)
      image_tag('email/spacer.gif',
                :alt => ' ',
                :height => width,
                :width => height,
                :style => "display:block;")
    end

    def para(&block)
      wrap_erb('font-size: 14px;', &block)
    end

    def intro(&block)
      wrap_erb(big_bold_font, &block)
    end

    def call_to_action(link, text)
      "<a href=\"#{link}\" style=\"#{big_bold_font} line-height: 50px; display: block; color: #ffffff; background: #{colors[:custom_primary]}; border-radius: 5px; text-align: center;\">#{text}</a><br /><br />".html_safe
    end

    private

    def font_family
      "font-family: 'Gotham SSm A', 'Gotham SSm B', 'Helvetica', Helvetica, Arial, sans-serif;"
    end

    def big_bold_font
      "#{font_family}; font-size: 18px; font-weight: bold;"
    end

    def wrap(content, style)
      "<div style=\"#{font_family} line-height: 1.5; color: #333333; #{style}\">#{content}</div><br /><br />"
    end

    def wrap_erb(style, &block)
      concat(wrap(capture(&block), style).html_safe)
    end
  end
end
