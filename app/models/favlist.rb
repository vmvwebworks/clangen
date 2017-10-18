class Favlist
  include Mongoid::Document
  include Mongoid::Timestamps

  field :favlistname, :type => String
  field :owner, :type => String
  field :favtracklist, :type => Array
  embedded_in :users
end
