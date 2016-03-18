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
    message = Message.find(id)
    new_content = params[:edited_message]
    message.update_attribute(:content, new_content)
    message.update_attribute(:edited, true)
    @messages = Message.all
    render "index"
  end

  def like
    message_id = params[:message_id]
    message = Message.find(message_id)

    liker_id = session[:current_user_id]
    liker = User.find(liker_id)

    author_id = message.user_id
    author = User.find(author_id)
    author_name = author.name

    message.likes.create(user: liker)
    puts "The content of this liked message is #{message.content}. The person who liked is #{User.find(liker_id).name}. The author is #{author_name}"
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

  def logging_in
    #login
    @users = User.all
    @messages = Message.all
    @email = params[:email]
    password = params[:password]
    user = User.find_by(email: @email)
    informs = User.login(user,password)
    session[:current_user_id] = user.id if informs[1] == "index"
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
    session[:current_user_id] = user.id if informs[1] == ""
    @message = informs[0]
    @og = informs[2]
    render informs[1]
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
