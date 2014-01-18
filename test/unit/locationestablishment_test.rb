require 'test_helper'

class LocationestablishmentTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Locationestablishment.new.valid?
  end
end
