class MessagesController < ApplicationController
  before_action :set_room
  before_action :set_message, only: [:show]
  layout false

  def index
    @messages = @room.messages
  end

  def show
  end

  def create
    @message = @room.messages.new(message_params)
    @message.user = current_user

    if @message.save
      render action: 'show', status: :created, location: [@room, @message]
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  private
    def set_room
      @room = Room.find(params[:room_id])
    end

    def set_message
      @message = @room.messages.find(params[:id])
    end

    def message_params
      params.require(:message).permit(:content)
    end

end