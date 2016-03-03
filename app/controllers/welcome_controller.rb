class WelcomeController < ApplicationController
  def delete_message
    message_id = params[:message_id]
    message = Message.find(message_id)
    message.delete
    @messages = Message.all
    render "index"
  end
  def edit
    id = params[:message_id]
    new_content = params[:edited_message]
    message = Message.find(id)
    message.update_attribute(:content, new_content)
    message.update_attribute(:edited, true)
    @messages = Message.all
    render "index"
  end
  def index
    @users = User.all
    @messages = Message.all
    @email = params[:email]
    password = params[:password]
    name = params[:name]
  end
  def login
    puts "logging in check"
    @og = "hidden"
  end
  def show
    @user_id = params[:id]
  end

  def have_they_signed_up
    #login
    @users = User.all
    @messages = Message.all
    @email = params[:email]
    password = params[:password]
    email_id = User.find_by(email: @email)
    password_id = User.find_by(password: password)
    if email_id == password_id && email_id && password_id
      name = User.find(email_id).name
      @message = "Welcome back #{name}"
      session[:current_user_id] =email_id.id
      render "index"
    elsif email_id
      @message = "Email doesn't match the password."
      @og = "hidden"
      render "login"
    else
      @message = "Email not found."
      @og = "hidden"
      render "login"
    end
  end

  def signup_checking_for_signup
    #sign up
    @messages = Message.all
    @email = params[:email]
    password = params[:password]
    name = params[:name]
    if User.find_by(email: @email)
      @message = "Email already in use."
      @og = "hidden"
      render "login"
    else
      user = User.new
      user.email = @email
      user.name = name
      user.password = password
      user.save
      @message = "Sign up successful!!"
      session[:current_user_id] = user.id
      render "index"
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
