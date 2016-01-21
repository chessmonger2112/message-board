require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Exanple User", email: "poop")
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
    @user.email = "poop"
    assert @user.valid?

    user2 = User.create(name: "butttttt", email:"poop")
    assert @user.valid?
  end
end
