class MessageController < ApplicationController
  def newWallMessage
    User.find_by(username: params[:username]) do |userMessaged|
      Message.create(
        messagecontent: params[:messageContent],
        messagedestiny: userMessaged.id,
        messagesender: current_user.id,
        messagetype: "wallMessage"
      )
      if current_user.id == userMessaged.id
        return redirect_to '/'
      else
        return redirect_to '/user/'+userMessaged.username
      end
    end
  end
end
