class EventsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]
    
    def index
        @events = Event.all
    end

    def new
        @event = Event.new
    end

    def create
        @event = current_user.hosted_events.build(event_params)

        if @event.save
            redirect_to :root and return
        end
        render :new
    end

    def show
        @event = Event.find(params[:id])
    end

    private
        def event_params
            params.require(:event).permit(:name, :location, :event_date, :host_id)
        end
end
