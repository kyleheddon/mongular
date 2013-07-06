class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :update, :destroy]
  layout false

  def index
    @rooms = Room.all
  end

  def show
  end

  def create
    @room = Room.new(room_params)

    if @room.save
      render action: 'show', status: :created, location: @room
    else
      render json: @room.errors, status: :unprocessable_entity
    end
  end

  def update
    if @room.update(room_params)
      head :no_content
    else
      render json: @room.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @room.destroy
    head :no_content
  end

  private
    def set_room
      @room = Room.find(params[:id])
    end

    def room_params
      params.require(:room).permit(:name)
    end
end
