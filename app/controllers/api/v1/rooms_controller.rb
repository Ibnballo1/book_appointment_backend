class Api::V1::RoomsController < ApplicationController
  before_action :set_room, only: %i[show update destroy]

  # GET /api/rooms
  def index
    @rooms = Room.all
    render json: @rooms
  end

  # GET /api/rooms/:id
  def show
    render json: @room
  end

  def create
    if @current_user.role == 'user'
      render(json: { error: 'User not allowed to create rooms' }, status: 401)
      return
    end
    @room = Room.new(room_params)

    if @room.save
      render json: @room, status: :created
    else
      render json: @room.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/rooms/:id
  def update
    if @room.update(room_params)
      render json: @room
    else
      render json: @room.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/rooms/:id
  def destroy
    if @current_user.role == 'user'
      render(json: { error: 'User not allowed to delete rooms' }, status: 401)
      return
    end
    @room.destroy
    head :no_content
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.permit(:name, :description, :photo, :city, :price)
  end
end
