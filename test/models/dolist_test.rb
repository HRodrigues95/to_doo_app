require 'test_helper'

class DolistTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user   = User.new(
      name:  "Example user",
      email: "example@user.com",
      password: "foobar",
      password_confirmation: "foobar"
    )
    @tolist = Dolist.new(
      name:    "Example List",
      user_id: 1
    )
    @user.save
  end

  test "should have a title" do
    @tolist.name = "   "
    assert_not @tolist.valid?
  end

  test "user should exits" do
    listuser = User.find(@tolist.user_id)
    assert_not listuser.nil?
  end
end
