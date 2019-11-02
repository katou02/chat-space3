class MessagesController < ApplicationController
  before_action :set_group

  def index
    logger.debug("messages controller index")
    @message = Message.new
    @messages = @group.messages.includes(:user)
    logger.debug(@message)
    logger.debug(@messages)
    logger.debug(@group)
  end

  def create
    @message = @group.messages.new(message_params)
    if @message.save
      redirect_to group_messages_path(@group), notice: 'メッセージが送信されました'
    else
      @messages = @group.messages.includes(:user)
      flash.now[:alert] = 'メッセージを入力してください。'
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end

  def set_group
    logger.debug("if文の中に入りました")
    logger.debug(params)
    @group = Group.find(params[:group_id])
  end
end
