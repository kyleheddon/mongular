module WebSocketController
  module Parameters
    def params
      @params ||= ActionController::Parameters.new(message)
    end
  end
end