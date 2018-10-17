module ApplicationHelper

    def is_active_controller(controller_name)
        params[:controller] == controller_name ? "active" : nil
    end

    def is_active_action(action_name)
        params[:action] == action_name ? "active" : nil
    end

  def create_user_activity(activity, controller = nil, action = nil)
      UserActivity.create! username: current_user.username,
                           activity: activity,
                           controller: controller,
                           action: action,
                           time: Time.now
  end
end
