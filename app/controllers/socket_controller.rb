class SocketController < WebsocketRails::BaseController
  def initialize_session
    # perform application setup here
    controller_store[:message_count] = 0
  end

  def holla
    new_message = { cow: 'moo', original_message: message }
    broadcast_message :holla_back, new_message
  end
end