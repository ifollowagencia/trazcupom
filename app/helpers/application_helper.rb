module ApplicationHelper

  def phone_number_link(text)
    sets_of_numbers = text.scan(/[0-9]+/)
    number = "+55-#{sets_of_numbers.join('-')}"
    link_to text, "tel:#{number}"
  end
  def javascript(*args)
  content_for(:head) { javascript_include_tag(*args) }
end


end
