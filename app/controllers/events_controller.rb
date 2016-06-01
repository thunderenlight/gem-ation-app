class EventsController < ApplicationController
  # before_action :authenticate_user!
  before_action :load_activities, only: [:index, :show, :new, :edit]

  def index
    @events = Event.order('created_at DESC')
    # @upcoming_events = @events.upcoming_events
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
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      flash[:success] = "event updated!"
      redirect_to @event
    else
      render 'edit'
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :location, :description, :date, :image, :venue)
  end

  def load_activities
    @activities = PublicActivity::Activity.order('created_at DESC').limit(20)
  end

end
