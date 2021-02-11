require "test_helper"

class QuestionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get questions_new_url
    assert_response :success
  end

  test "should get answer" do
    get questions_answer_url
    assert_response :success
  end

  test "should get result" do
    get questions_result_url
    assert_response :success
  end
end
