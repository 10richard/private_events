class AttendancesController < ApplicationController
    before_action :authenticate_user!

    def create
        event = Event.find(params[:event_id])
        attendance = Attendance.new(event_id: event.id, attendee_id: current_user.id)
    
        if attendance.save
          redirect_to :root and return
        end
    end

    def destroy
        current_user.attendances.find(event: params[:event_id]).destroy
    end
end
