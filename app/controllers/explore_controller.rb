class ExploreController < ApplicationController
  def index
    # Cambiar esto por filtro donde User.all,
    @listofusers = User.all
    @listoftracks = Track.all
  end
  def search
    @listofusers = []
    if params[:queryType] == "users"
      User.each do |matchingUser|
        if matchingUser.username.match(params[:queryField])
          @listofusers.push(matchingUser)
        end
      end
      render "index"
    elsif params[:queryType] == "tracks"
      client = Yourub::Client.new
      client.search(query: params[:queryField]) do |video|
        puts "*********** every single video ***********"
        puts video
        puts "*********** video title  ***********"
        puts video['snippet']['title']
      end
      return redirect_to('/explore')
    else
      return redirect_to('/explore')
    end
  end
end
