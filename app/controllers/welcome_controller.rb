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

  def have_they_signed_up
    email = params[:email]
    password = params[:password]
    email_id = User.find_by(email: email)
    password_id = User.find_by(password: password)
    if email_id == password_id && email_id && password_id
      name = User.find(email_id).name
      @message = "Welcome back #{name}"
    elsif email_id
      @message = "Email doesn't match the password."
    else
      @message = "Email not found."
    end
  end


  def save
    content = params[:message]
    @email = params[:email]
    user_id = User.find_by(email: @email).id
    new_message = Message.new
    new_message.content = content
    new_message.user_id = user_id
    new_message.save
    @messages = Message.all
    render "index"
  end
end
