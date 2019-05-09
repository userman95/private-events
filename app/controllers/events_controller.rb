class EventsController < ApplicationController

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:success] = 'Event Created'
      redirect_to controller: 'events', action: 'show', id: @event.id
    else
      flash[:danger] = 'Something went wrong'
    end
  end

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name)
  end
end
