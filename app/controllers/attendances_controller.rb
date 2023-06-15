class AttendancesController < ApplicationController
    before_action :authenticate_user!

    def create
        event = Event.find(params[:event_id])
        attendance = Attendance.new(event_id: event.id, attendee_id: current_user.id, attending: true)
    
        if attendance.save
          redirect_to request.referrer and return
        end
    end

    def destroy
        Attendance.find_by(event_id: params[:id], attendee_id: current_user.id).destroy
        redirect_to request.referrer
    end
end
