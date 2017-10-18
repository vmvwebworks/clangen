require "test_helper"

class FavlistTest < ActiveSupport::TestCase
  def favlist
    @favlist ||= Favlist.new
  end

  def test_valid
    assert favlist.valid?
  end
end
