# Load the Rails application.
require File.expand_path('../application', __FILE__)

require 'will_paginate'

# Initialize the Rails application.
Trazcupom::Application.initialize!

WillPaginate::ViewHelpers.pagination_options[:renderer] = 'AjaxWillPaginate'