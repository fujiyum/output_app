class CommentsController < ApplicationController

    def create
    input = Input.find(params[:input_id])
    comment = current_user.comments.new(comment_params)
    comment.input_id = input.id
    comment.save
    redirect_to input_path(input)
    end

    def destroy
    end

    private
    def comment_params
        params.require(:comment).permit(:comment)
    end

end
