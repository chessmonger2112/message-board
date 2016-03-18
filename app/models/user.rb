class User < ActiveRecord::Base
  def self.login user, password
    if user && password == user.password && user.password && password
      name = User.find(user).name
      message = "Welcome back #{name}"
      render = "index"
      og = ""
    else
      if user
        message = "Email doesn't match the password."
      else
        message = "Email not found."
      end
      og = "hidden"
      render = "login"
    end
    return [message,render,og]
  end

  def self.sign_up email, password
    if User.find_by(email: email)
      message = "Email already in use."
      og = "hidden"
      render "login"
    else
      user = User.create({name: name, password: password, email: email})
      if user.valid?
        message = "Sign up successful!!"
        og = ""
        render "index"
      else
        message = "Invalid email."
        og = "hidden"
        render = "login"
      end
    end
    return [message,render,og]
  end

  has_many :messages
  has_many :likes
  has_many :liked_messages, :through => :likes, :source => :message
  validates :name, presence: true
  VALID_EMAIL_REGEX = /\w+@\w+\.\w+/
    validates :email, presence: true, length: {maximum: 255}, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
end
