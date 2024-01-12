class TasksController < ApplicationController
  def index
    @user = User.find_by(params[:user])
  end
end
