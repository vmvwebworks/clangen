class Artist
  include Mongoid::Document
  include Mongoid::Timestamps


  field :artistName, :type => String
  field :artistTag, :type => Array
  embeds_many :albums
  embeds_many :tracks

end
