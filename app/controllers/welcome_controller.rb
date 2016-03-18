class WelcomeController < ApplicationController
  def delete_message
    message_id = params[:message_id]
    Message.delete_message message_id
    @messages = Message.all
    render "index"
  end
  def edit
    id = params[:message_id]
    new_content = params[:edited_message]
    Message.edit id, new_content
    @messages = Message.all
    render "index"
  end

  def like
    message_id = params[:message_id]
    liker_id = session[:current_user_id]
    Message.like(message_id,liker_id)
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
    @og = "hidden"
  end
  def show
    @user_id = params[:id]
  end

  def logging_in
    #login
    @users = User.all
    @messages = Message.all
    @email = params[:email]
    password = params[:password]
    informs = User.login(@email,password)
    session[:current_user_id] = informs[3] if informs[1] == "index"
    @message = informs[0]
    @og = informs[2]
    render informs[1]
  end

  def signing_up
    #sign up
    @messages = Message.all
    @email = params[:email]
    password = params[:password]
    name = params[:name]
    informs = User.sign_up(@email,password)
    puts " user id should be #{informs[3]}"
    session[:current_user_id] = informs[3] if informs[1] == "index"
    @og = informs[2]
    @message = informs[0]
    render informs[1]
  end

  def save
    content = params[:message]
    @email = params[:email]
    User.save @email, content
    @messages = Message.all
    render "index"
  end
end
