class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :priority, only: [:show, :update]
  before_filter :authenticate_user!, except: [:index]

  def index
    if current_user
      @user = User.find(current_user)
      @tasks = @user.tasks
    end
  end


  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user
    if @task.save
      redirect_to @task
    else
      render 'new'
    end
  end

  def update
    if @task.update(task_params)
      redirect_to @task
    else
      render 'edit'
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :priority, :due_date)
  end

  def priority
    if @task.priority == 1
      @status = 'active'
    elsif @task.priority == 2
      @status = 'finished'
    elsif @task.priority == 0
      @status = 'inactive'
    end
  end
end
