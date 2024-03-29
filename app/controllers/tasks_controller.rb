class TasksController < ApplicationController
  before_action :task_reminder
  require 'date'

  def index
    @user = User.find_by(params[:user])
    @tasks = Task.all.order(start_date: :asc).page(params[:page]).per(10)
    @tasks = @tasks.joins(:categories).where(categories:{id:params[:category_id]})if params[:category_id].present?
    @categories = Category.all
  end

  def new
    @task = Task.new
    @categories = Category.all
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:notice] = 'おめでとう！タスクを作成できました'
      if @task.recurrence == "[\"0\", \"1\"]"
        task_repetition
      end
      redirect_to tasks_path
    else
      flash[:alert] = 'タスクを作成できませんでした'
      render :new, status: :unprocessable_entity
    end
  end
  
  def show
    @tasks = Task.all
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
    @categories = Category.all
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:notice] = 'おめでとう！タスクを更新できました'
      redirect_to tasks_path
    else
      flash[:alert] = 'タスクを更新できませんでした'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task = Task.find(params[:id])
    RecurringSchedule.where(task: @task).destroy_all
    @task.destroy!
    flash[:notice] = 'タスク完了です！よく頑張りました！'
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :start_date, :end_date, category_ids: [], recurrence: [])
  end

  def task_reminder
    if user_signed_in?
      @tasks = Task.all
      @tasks.each do |task|
        if task.end_date + 1.hour < Time.now
          flash[:alert] = "未完了のタスクがあるよ！大丈夫かな？"
        end
      end
    end
  end

  def task_repetition
    @task = Task.new(
        title: @task.title,
        description: @task.description,
        category_ids: @task.categories.ids,
        start_date: @task.start_date + 1.week,
        end_date: @task.end_date + 1.week,
      )
    @task.save!
  end
end
