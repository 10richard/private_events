class UsersController < ApplicationController

    def show 
        @hosted_events = User.find(current_user.id).events
    end
end
