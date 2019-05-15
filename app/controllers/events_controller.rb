class EventsController < ApplicationController
  before_action :logged_in_user, only: :create
  include SessionsHelper

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.create(event_params)
    if @event.valid?
      flash[:success] = 'Event Created'
      redirect_to controller: 'events', action: 'show', id: @event.id
    else
      flash[:danger] = 'Something went wrong'
    end
  end

  def index
    @events = Event.all
    @upcoming_events = Event.future
    @previous_events = Event.past
  end

  def show
    @event = Event.find(params[:id])
  end

  def logged_in_user
   unless logged_in?
     flash[:danger] = 'Please log in first'
     redirect_to login_url
   end
  end

  def event_params
    params.require(:event).permit(:name,:date)
  end
end
