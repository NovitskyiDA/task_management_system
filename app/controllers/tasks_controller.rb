class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:index]

  def index
    if current_user
      @active_tasks = current_user.tasks.active.order(:priority)
      @completed_tasks = current_user.tasks.completed
      @inactive_tasks = current_user.tasks.inactive
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
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    if @task.update(task_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  def destroy_multiple
    tasks = Task.where(:id => params[:task_ids])
    tasks.destroy_all
    redirect_to root_path
  end

  def sort
    @tasks = current_user.tasks.order(:title)
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :priority, :due_date, :status)
  end

end
