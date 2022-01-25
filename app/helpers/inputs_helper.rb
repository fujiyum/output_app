module InputsHelper

    def new_output_by?
        user_signed_in? && @user.id == current_user.id && @input.limit > Time.current
    end

end
