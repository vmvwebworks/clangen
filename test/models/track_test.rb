require "test_helper"

class TrackTest < ActiveSupport::TestCase
  def track
    @track ||= Track.new
  end

  def test_valid
    assert track.valid?
  end
end
