class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resources)
        if current_user
            flash[:notice] = "Welcome Back"
            user_path(current_user.id)
        else
            flash[:notice] = "Welcome"
            titles_path
        end
    end

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end

end
