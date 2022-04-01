class ChatsController < ApplicationController
  before_action :set_current_user
  before_action :set_chat, only: :show

  def index
    @chats = @current_user.chats
    @pagy, @messages = pagy(@chats, items: 10)
    render json: {
      chats:
        ActiveModel::Serializer::CollectionSerializer.new(
          @chats, serializer: ChatSerializer
        ),
      info: {
        page: @pagy.page,
        next: @pagy.next,
        items: @pagy.items
      }
    }
  end

  def show
    render json: @chat, serializer: ChatSerializer
  end

  def create
    @chat = Chat.new(create_chat_params)
    @chat.save!

    render json: @chat, serializer: ChatSerializer
  end

  private

  def set_current_user
    current_user
  end

  def current_user
    @current_user ||= User.find(1)
  end

  def set_chat
    @chat = Chat.find(params[:id])
  end

  def create_chat_params
    params.permit(
      :title,
      user_ids: []
    )
  end
end
