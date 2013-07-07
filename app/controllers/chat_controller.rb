class ChatController < WebsocketRails::BaseController
  include ActiveSession::CurrentUser
  include WebSocketController::Parameters

  def initialize_session
    controller_store[:message_count] = 0
  end

  def new_message
    room = Room.find(params[:room_id])
    @new_message = room.messages.new(message_params)
    @new_message.user = current_user

    if @new_message.save
      broadcast_message "#{room.id}_message_created", message_attributes.merge(current_user_attributes)
    else
      send_message "#{room.id}_message_created", {errors: @new_message.errors}
    end
  end

  private

    def message_params
      params.require(:message).permit(:content)
    end

    def current_user_attributes
      { user: current_user.attributes.slice('name', 'id') }
    end

    def message_attributes 
      @new_message.attributes.slice('content', 'created_at')
    end

end