module ApplicationHelper
    def logged_in?
        !!session[:user_id]
    end

    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def nested_route?
        !!params[:user_id]
    end

    def redirect_if_not_logged_in
        flash[:error] = "You have to login to view that page!"
        redirect_to login_path if !logged_in?
    end
    
    def display_flash
        flash[:error] if !logged_in?
    end
    
    def display_links
        (link_to "all gardens", gardens_path) + " || " +
        (link_to "all plants", plants_path) + " || " +
        (link_to "add garden", new_user_garden_path(current_user)) + " || " +
        (link_to "my gardens", user_gardens_path(current_user)) +
        content_tag(:br)

    end
end
