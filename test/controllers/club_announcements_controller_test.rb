require 'test_helper'

class ClubAnnouncementsControllerTest < ActionController::TestCase
  setup do
    @club_announcement = club_announcements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:club_announcements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create club_announcement" do
    assert_difference('ClubAnnouncement.count') do
      post :create, club_announcement: { club_id: @club_announcement.club_id, content: @club_announcement.content, user_id: @club_announcement.user_id }
    end

    assert_redirected_to club_announcement_path(assigns(:club_announcement))
  end

  test "should show club_announcement" do
    get :show, id: @club_announcement
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @club_announcement
    assert_response :success
  end

  test "should update club_announcement" do
    patch :update, id: @club_announcement, club_announcement: { club_id: @club_announcement.club_id, content: @club_announcement.content, user_id: @club_announcement.user_id }
    assert_redirected_to club_announcement_path(assigns(:club_announcement))
  end

  test "should destroy club_announcement" do
    assert_difference('ClubAnnouncement.count', -1) do
      delete :destroy, id: @club_announcement
    end

    assert_redirected_to club_announcements_path
  end
end
