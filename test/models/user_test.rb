require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Example User", email: "poop@poop.com")
  end

  test "the truth" do
    assert @user.valid?
  end
  test "testing name's presence" do
    @user.name = "   "
    assert_not @user.valid?
  end
  test "testing email's presence" do
    @user.email = "  "
    assert_not @user.valid?
  end

  test "testing uniqueness of email" do
    @user.email = "big@poops.com"
    assert @user.valid?
    @user.save
    user2 = User.create(name: "butttttt", email:"big@poops.com")
    user2.email.upcase!
    assert_not user2.valid?
  end

  test "testing length of email" do
    @user.email = "a" * 256
    assert_not @user.valid?
  end

  test "testing valid email formats" do
    valid_emails = %w[sup@bro.com heyyy@sup.sup hello@hi.sup]
    valid_emails.each do |valid_email|
      @user.email = valid_email
      assert @user.valid?, "#{valid_email.inspect} should be valid"
    end
  end

  test "testing invalid email formats" do
    valid_emails = %w[sup@sup,com sup@sup+sup.sup sup_at_sup.sup]
    valid_emails.each do |valid_email|
      @user.email = valid_email
      print valid_email
      puts " does it match? #{!!valid_email.match(/\w+@\w+\.\w+/)}"
      assert_not @user.valid? , "#{valid_email.inspect} should not be valid."
    end
  end
end
