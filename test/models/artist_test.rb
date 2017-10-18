require "test_helper"

class ArtistTest < ActiveSupport::TestCase
  def artist
    @artist ||= Artist.new
  end

  def test_valid
    assert artist.valid?
  end
end
