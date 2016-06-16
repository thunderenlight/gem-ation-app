class PagesController < ApplicationController
	# before_action :authenticate_user!

  def index
  	@event = Event.last
  	# @feed = current_user.facebook.get_connections('me', 'photos')
    # @profile = current_user.facebook.get_object('me') { |data| data['education']}
  	
  end
end
