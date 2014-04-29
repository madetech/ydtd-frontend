require 'app/helpers/ydtd_frontend/view_helper'
require 'app/helpers/ydtd_frontend/mailer_helper'
require 'app/helpers/ydtd_frontend/colors_helper'
require 'app/helpers/ydtd_frontend/breadcrumbs_helper'
require 'app/helpers/ydtd_frontend/flash_helper'

module MockHelper
  def logo_url
    'http://placehold.it/170x62/00cdff/ffffff/'
  end

  def link_to_unless_current(*args)
    link_to(*args)
  end

  class Flash
    def empty?; true; end
  end

  def flash
    Flash.new
  end

  def tracking
    {}
  end
end

class String
  def html_safe
    to_s
  end
end

helpers YdtdFrontend::ViewHelper
helpers YdtdFrontend::MailerHelper
helpers YdtdFrontend::ColorsHelper
helpers YdtdFrontend::BreadcrumbsHelper
helpers YdtdFrontend::FlashHelper
helpers MockHelper
