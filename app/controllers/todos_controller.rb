class TodosController < ApplicationController
  respond_to :json

  # GET /todos
  # GET /todos.json
  def index
    respond_with Todo.all
  end

  # GET /todos/1
  # GET /todos/1.json
  def show
    respond_with Todo.find(params[:id])
  end

  # GET /todos/1/edit
  def edit
    @todo = Todo.find(params[:id])
  end

  # POST /todos
  # POST /todos.json
  def create
    @todo = Todo.new(params[:todo])

  if @todo.save
      render json: @todo, status: :created, location: @todo
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  # PUT /todos/1
  # PUT /todos/1.json
  def update
    @todo = Todo.find(params[:id])

    if @todo.update_attributes(params[:todo])
      head :no_content
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /todos/1
  # DELETE /todos/1.json
  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    head :no_content
  end
end
