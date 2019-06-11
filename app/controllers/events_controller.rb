class EventsController < ApplicationController

  before_action :logged_in_user, only: :create

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = 'Event Created'
      redirect_to @event
    else
      render :new
    end
  end

  def index
    @events = Event.all
    @upcoming_events = Event.future
    @previous_events = Event.past
  end

  def show
    @event = Event.find(params[:id])
    @users = User.all
  end

  def invite
    @event = Event.find_by(id: params[:data][:attended_event_id])
    @invited = User.find(params[:id])
    if @invited.attended_events << @event
      flash[:success] = "Invitation was sent."
    else
      flash[:danger] = "There was an error to send the invitation."
    end
    redirect_to @event
  end

  private
    def event_params
      params.require(:event).permit(:name,:date)
    end
end
