class Chats::MessagesController < ApplicationController
  before_action :set_current_user, :set_chat
  before_action :set_message, only: %i[destroy update]

  def create
    @message = Chat::Message.new(create_message_params)
    @message.user = @current_user
    @message.chat = @chat
    @message.save!

    render json: @message, serializer: MessageSerializer
  end

  def destroy
    @message.destroy!
    render json: {}, status: :no_content
  end

  def update
    @message = Chat::Message.find(params[:id])

    @message.update!(update_message_params)

    render json: @message, serializer: MessageSerializer
  end

  private

  def set_current_user
    current_user
  end

  def current_user
    @current_user ||= User.find(1)
  end

  def set_chat
    @chat = Chat.find(params[:chat_id])
  end

  def set_message
    @message = Chat::Message.find(params[:id])
  end

  def create_message_params
    params.permit(:content)
  end

  def update_message_params
    params.permit(:content)
  end
end
