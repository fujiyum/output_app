class NicesController < ApplicationController

  def create
    @title = Title.find(params[:title_id])
    nice = current_user.nices.build(title_id: params[:title_id])
    nice.save
  end

  def destroy
    @title = Title.find(params[:title_id])
    nice = Nice.find_by(user_id: current_user.id, title_id: params[:title_id])
    nice.destroy
  end


end
