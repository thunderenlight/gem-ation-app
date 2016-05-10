class PagesController < ApplicationController
	before_action :authenticate_user!

  def index
  	@event = Event.last
  	puts current_user.class
  	puts "EEEEEEEE"
  end
end
