require "test_helper"

class JugadorControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get jugador_create_url
    assert_response :success
  end

  test "should get store" do
    get jugador_store_url
    assert_response :success
  end
end
