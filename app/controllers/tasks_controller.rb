class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update, :destroy, :change]
  before_action :authenticate_user!

  def index
    @to_do = current_user.tasks.to_do
    @doing = current_user.tasks.doing
    @done = current_user.tasks.done
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = current_user.tasks.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_url, notice: 'Task was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to tasks_url, notice: 'Task was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
    end
  end

  def change
    @task.update_attributes(state: params[:state])
    respond_to do |format|
      format.html {redirect_to tasks_path, notice: "Task state was successfully updated."}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:content, :state)
    end
end
