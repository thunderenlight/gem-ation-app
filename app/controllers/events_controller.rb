class EventsController < ApplicationController

  def index
    @event = Event.order('created_at DESC')
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
    @invitations = @event.invitations
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:success] = "event added!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :location, :description)
  end

end
