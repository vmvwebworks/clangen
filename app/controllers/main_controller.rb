
class MainController < ApplicationController
  def index
    @listofusers = User.all
    @friendlist = []
    @wallMessages = []
    if current_user
      puts "*** antes de entrar en la busqueda de Message ***"
      Message.each do |wallMessage|
        if wallMessage.messagedestiny == String(current_user.id)
          puts "*** wallMessage.messagesender ***"
          puts wallMessage.messagesender
          User.find_by(id: wallMessage.messagesender) do |messageSender|
            puts messageSender.username
            wallMessage.messagesender = messageSender.username
          end
          @wallMessages.push(wallMessage)
        end
      end

      Contact.find_by(owner: current_user.id) do |ownContactList|
        puts "***list of contacts***"
        puts ownContactList.friendlist
        for singleContact in ownContactList.friendlist
          puts "***singleContact***"
          puts singleContact
          puts "***friendlist***"
          puts @friendlist
          User.find_by(id: singleContact) do | returnedUser |
            puts "***returnedUser***"
            puts returnedUser.username
            @friendlist.push(returnedUser.username)
          end
        end
      end
    end

  end
end
