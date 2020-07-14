class TasksController < ApplicationController
  before_action :find_params, only: [:edit, :update]
  before_action :set_status, only: [:index, :edit]

  def index
    @task = Task.new
    
  end

  def create
    @task = Task.new(post_params)
    # respond_to do |format|
    #   format.html {redirect_to :root}
    #   format.json {render json: @task}
    # end
    if @task.save
      redirect_to root_path
    end
    
  end

  def edit
  
  end

  def update
    if @task.update(post_params)
      redirect_to root_path
    else
      render :new
    end
    
  end

  def destroy
    task = Task.find(params[:id])
    if task.destroy
      redirect_to root_path
    end
  end

  def complete
    task = Task.find(params[:id])
    task.is_complete = "完了"
    if task.save
      redirect_to root_path
    end
  end

  def incomplete
    task = Task.find(params[:id])
    task.is_complete = "未完了"
    if task.save
      redirect_to root_path
    end
  end

  private
  def find_params
    @task = Task.find(params[:id])
  end

  def post_params
    params.require(:task).permit(:body , :is_complete, )
  end

  def set_status
    @tasks_incomplete = Task.all.where(is_complete: "未完了").order(created_at: :desc)
    @tasks_complete = Task.all.where(is_complete: "完了").order(created_at: :desc)
  end
end
