require 'test_helper'

class PartnerMailerTest < ActionMailer::TestCase
  test "send_ticket" do
    mail = PartnerMailer.send_ticket
    assert_equal "Send ticket", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
