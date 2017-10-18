class ContactController < ApplicationController
  def addNew
    User.find_by(username: params[:username]) do |friendUser|
      puts "***friendUser***"
      puts friendUser
      if Contact.where(owner: current_user.id).exists?
        puts "***llega a entrar en la query de comprobacion***"
        Contact.find_by(owner: current_user.id) do |ownContactRegistry|
          puts "***llega a entrar en la query para devolver el objeto contacto***"
          if Contact.where(owner: current_user.id, friendlist: friendUser.id).exists?
            return redirect_to "/"
          else
            ownContactRegistry.push(friendlist: friendUser.id)
          end
        end
      else
        puts "***aqui devolvera la creacion del contacto con el correspondiente push"
        Contact.create(owner: current_user.id) do |ownContactRegistry|
          ownContactRegistry.push(friendlist: friendUser.id)
        end
        return redirect_to "/"
      end
      redirect_to "/"
    end
  end
end
