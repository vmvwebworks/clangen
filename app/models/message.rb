class Message
  include Mongoid::Document
  include Mongoid::Timestamps

  field :messagecontent, :type => String
  field :messagedestiny, :type => String
  field :messagesender, :type => String
  field :messagetype, :type=> String
end
