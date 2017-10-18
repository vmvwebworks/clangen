class ProfileController < ApplicationController
  def index
    User.find_by(username: params[:username]) do |watchingUser|
      @watchingUser = watchingUser
      @friendlist = []
      @wallMessages = []
      Contact.find_by(owner: params[:username]) do |contactList|
        for singleContact in contactList.friendlist
          User.find_by(id: singleContact) do | returnedUser |
            @friendlist.push(returnedUser.username)
          end
        end
      end
      Message.each do |wallMessage|
        if wallMessage.messagedestiny == String(@watchingUser.id)
          User.find_by(id: wallMessage.messagesender) do |messageSender|
            wallMessage.messagesender = messageSender.username
          end
          @wallMessages.push(wallMessage)
        end
      end
    end
  end
end
