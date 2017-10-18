class Track
  include Mongoid::Document
  include Mongoid::Timestamps

  field :trackname, :type => String
  field :trackalbum, :type => Array
  field :trackartist, :type => Array
  field :tracktag, :type => Array
  field :submitter, :type => String
  field :tokenlink, :type => String
  embedded_in :albums
  embedded_in :artists
end
