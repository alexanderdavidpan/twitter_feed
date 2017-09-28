require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "create user while setting primary key id" do
    user = User.new(id: 1, name: "test", screen_name: "test")
    assert user.valid?
    assert user.save
  end

  test "user attributes presence validation" do
    user = User.new
    refute user.valid?
    user.errors.messages.each do |key, msg|
      assert [:id, :name, :screen_name].include?(key)
      assert_equal ["can't be blank"], msg
    end
  end

  test "user attributes uniqueness validation" do
    first_user = User.new(id: 1, name: "uno", screen_name: "uno")
    assert first_user.valid?
    assert first_user.save

    # Test id uniquness validation
    second_user = User.new(id: 1, name: "dos", screen_name: "dos")
    refute second_user.valid?
    assert_equal ["has already been taken"], second_user.errors.messages[:id]
    refute second_user.save

    # Test screen_name uniquness validation
    third_user = User.new(id: 2, name: "uno", screen_name: "uno")
    refute third_user.valid?
    assert_equal ["has already been taken"], third_user.errors.messages[:screen_name]
    refute third_user.save

    # Test screen_name case insensitive uniquness validation
    fourth_user = User.new(id: 2, name: "uno", screen_name: "UNO")
    refute fourth_user.valid?
    assert_equal ["has already been taken"], fourth_user.errors.messages[:screen_name]
    refute fourth_user.save
  end
end
