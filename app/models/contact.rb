class Contact
  include Mongoid::Document
  include Mongoid::Timestamps


  field :owner, :type => String
  field :friendlist, :type => Array
  #embedded_in :users
end
