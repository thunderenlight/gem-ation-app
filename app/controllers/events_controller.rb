class EventsController < ApplicationController
  before_action :authenticate_user!

  def index
    @events = Event.order('created_at DESC')
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

  
  def edit
    @event = Event.find(params[:id])
    puts @event.title
  end

  def update
    if @event.update_attributes(event_params)
      flash[:success] = "event updated!"
      redirect_to @event
    else
      render 'edit'
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :location, :description)
  end

end
