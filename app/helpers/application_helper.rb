module ApplicationHelper
	def paginate(collection, params= {})
    will_paginate collection, params.merge(:renderer => RemoteLinkPaginationHelper::LinkRenderer)
  end
  def phone_number_link(text)
    sets_of_numbers = text.scan(/[0-9]+/)
    number = "+55-#{sets_of_numbers.join('-')}"
    link_to text, "tel:#{number}"
  end
end
