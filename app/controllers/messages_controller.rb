class MessagesController < ApplicationController
  before_action :require_signed_in!

  def new
   @Message = Message.new
  end

 def create
   @message = Message.new(message_params)
   to_id = User.find_by_email(params[:message][:to_email]).id
   @message.to_id = to_id
   @message.from_id = current_user.id
   @message.read = false
   @message.active = true
   @message.conversation_id = 1

   if @message.save
     redirect_to root_url
   else
     flash.now[:errors] = @message.errors.full_messages
     render :new
   end
 end

 def message_params
   params.require(:message).permit(:conversation_id, :body, :subject)
 end
end
