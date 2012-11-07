class TasksController < ApplicationController

  http_basic_authenticate_with :name => "user", :password => "pass", :except => [:index, :show]

  # GET /tasks
  # GET /tasks.json
  def index
      @tasks = Task.order("priority")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = Task.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @user = User.find(params[:user_id])
    @task = @user.tasks.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @user = User.find(params[:user_id])
    @task = @user.tasks.create(params[:task])
    
    redirect_to user_path(@user)
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to @user, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @user = User.find(params[:user_id])
    @task = @user.tasks.find(params[:id])
    @task.destroy

    redirect_to user_path(@user)
  end
end
