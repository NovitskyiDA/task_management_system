class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:index]

  def index
    if current_user
      @user = User.find(current_user)
      if params[:sort] == 'title'
        @tasks = @user.tasks.order(:title)
      else
        @active_tasks = @user.tasks.active
        @completed_tasks = @user.tasks.completed
        @inactive_tasks = @user.tasks.inactive
      end
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
    redirect_to root_path
  end

  def destroy_multiple
    tasks = Task.where(:id => params[:task_ids])
    tasks.delete_all
    redirect_to root_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :priority, :due_date)
  end

end
