require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Exanple User", email: "user@example.com")
  end

  test "the truth" do
    assert @user.valid?
  end
end
