class WelcomeController < ApplicationController
  def index
    @users = User.all
    @messages = Message.all
    @email = params[:email]
    password = params[:password]
    name = params[:name]
    user = User.new
    user.email = @email
    user.name = name
    user.password = password
    user.save
  end
  def login
    puts "logging in check"
  end

  def save
    content = params[:message]
    @email = params[:email]
    user_id = User.find_by(email: @email).id
    # user_id = 15
    puts "Da content is #{content}"
    new_message = Message.new
    new_message.content = content
    new_message.user_id = user_id
    new_message.save
    @messages = Message.all
    render "index"
  end
end
