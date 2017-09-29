require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def setup
    @controller = self.class.controller_class.new
  end

  test "get tweets" do
    User.expects(:find_or_create_by_screen_name)
      .with("kobebryant")
      .returns(User.new(id: 1, name: "Kobe Bryant", screen_name: "kobebryant"))

    TWITTER_CLIENT.expects(:user_timeline).
      with(1, count: 10)
      .returns([])

    @request.accept = "text/javascript"

    get :tweets, {"screen_name" => "kobebryant"}
  end
end
