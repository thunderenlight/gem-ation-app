class PagesController < ApplicationController
  def index
  	@event = Event.last
  end
end
