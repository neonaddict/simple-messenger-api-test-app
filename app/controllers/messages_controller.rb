class MessagesController < ApplicationController
  before_action :set_current_user, :set_chat
  before_action :set_message, only: %i[destroy update]

  def index
    @pagy, @messages = pagy(@chat.messages, items: 10)
    render json: {
      messages:
        ActiveModel::Serializer::CollectionSerializer.new(
          @messages, serializer: MessageSerializer
        ),
      info: {
        page: @pagy.page,
        next: @pagy.next,
        items: @pagy.items
      }
    }
  end

  def create
    @message = Chat::Message.new(
      create_message_params.merge(
        user: @current_user,
        chat: @chat
      )
    )
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
    @chat = current_user.chats.find(params[:chat_id])
  end

  def set_message
    @message = Chat::Message.find(params[:id])
  end

  def create_message_params
    params.permit(:content)
  end

  def update_message_params
    params.permit(:content, read_by: [])
  end
end
