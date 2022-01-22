class CommentsController < ApplicationController
  before_action :authenticate_user!

    def create
        input = Input.find(params[:input_id])
        comment = current_user.comments.new(comment_params)
        comment.input_id = input.id
        comment.save
        redirect_to input_path(input)
    end

    def destroy
        Comment.find_by(id: params[:id]).destroy
        redirect_to input_path(params[:input_id])
    end

    private
    def comment_params
        params.require(:comment).permit(:comment)
    end

end
