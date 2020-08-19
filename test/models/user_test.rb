require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @test_user = User.new(
      name:  "Example User",
      email: "user@example.com",
      password:              "foobar",
      password_confirmation: "foobar"
    )
  end

  test "should be valid" do
    assert @test_user.valid?
  end
  
  test "Name should be present" do
    @test_user.name = "     "
    assert_not @test_user.valid?
  end

  test "Email should be present" do
    @test_user.email = "     "
    assert_not @test_user.valid?
  end

  test "Name should not be too long" do
    @test_user.name = "a" * 51
    assert_not @test_user.valid?
  end

  test 'Email should not be too long' do
    @test_user.email = 'a' * 244 + '@example.com'
    assert_not @test_user.valid?
  end

  test "Email should be unique" do
    duplicate_user = @test_user.dup
    @test_user.save
    assert_not duplicate_user.valid?
  end

  test "password should be presnet (nonblank) and have a minimum length" do
    @test_user.password = @test_user.password_confirmation = " " * 6
    assert_not @test_user.valid?
    @test_user.password = @test_user.password_confirmation = "a" * 5
    assert_not @test_user.valid?
  end
end
