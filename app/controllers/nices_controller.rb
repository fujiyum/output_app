class NicesController < ApplicationController
  before_action :title_params

  def create
    Nice.create(user_id: current_user.id, title_id: @title.id)
  end

  def destroy
    Nice.find_by(user_id: current_user.id, title_id: @title.id).destroy
  end

  private

  def title_params
    @title = Title.find(params[:title_id])
  end


end
