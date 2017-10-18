class Album
  include Mongoid::Document
  include Mongoid::Timestamps

  field :albumname, :type => String
  field :albumartists, :type => Array
  field :albumyear, :type => String
  field :albumlabel, :type => String
  field :albumtracklist, :type => Array
  field :albumcover, :type => String
  field :albumtags, :type => Array
  embeds_many :tracks
  embedded_in :artists

end
