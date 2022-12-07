class NotificationsController < ApplicationController

    def index
        current_user.notifications.update_all(viewed: true)
        @notifications = current_user.notifications.order(created_at: :desc)
    end
end
