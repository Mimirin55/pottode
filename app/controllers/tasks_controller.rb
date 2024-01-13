class TasksController < ApplicationController
  def index
    @user = User.find_by(params[:user])
    @tasks = Task.all.order(start_date: :asc)
  end

  def new
    @task = Task.new
  end

  def create
    Rails.logger.debug(params.inspect)
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: 'おめでとう！タスクを作成できました'
    else
      flash.now[:danger] = 'タスクを作成できませんでした'
      render :new, status: :unprocessable_entity
    end
  end
  
  def edit
    @task = task.find(params[:id])
  end

  def update
    @task = task.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path, notice: 'おめでとう！タスクを更新できました'
    else
      flash.now[:danger] = 'タスクを更新できませんでした'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy!
    redirect_to tasks_path, notice: 'おめでとう！タスクを削除しました'
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :start_date, :end_date)
  end
end
