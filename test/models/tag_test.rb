require 'test_helper'

class TagTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @tag = Tag.new(
      name: 'example'
    )
  end

  test 'should not be empty' do
    @tag.name = ' ' * 5
    assert_not @tag.valid?
  end

  test 'should not be to large' do
    @tag.name = 'a' * 17
    assert_not @tag.valid?
  end

  test 'should not allow duplicates' do
    tagdup = @tag.dup
    @tag.save
    assert_not tagdup.valid?
  end
end
