class WelcomeController < ApplicationController
  def index
    @users = User.all
    @messages = Message.all
  end

  def save
    content = params[:content]
    puts "Da content is #{content}"
    new_message = Message.new
    new_message.content = content
    new_message.save
    @messages = Message.all
    render "index"
  end
end
