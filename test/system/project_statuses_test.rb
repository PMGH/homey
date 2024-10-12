require "application_system_test_case"

class ProjectStatusesTest < ApplicationSystemTestCase
  setup do
    @project_status = project_statuses(:one)
  end

  test "visiting the index" do
    visit project_statuses_url
    assert_selector "h1", text: "Project statuses"
  end

  test "should create project status" do
    visit project_statuses_url
    click_on "New project status"

    fill_in "Project", with: @project_status.project_id
    fill_in "Status", with: @project_status.status
    fill_in "User", with: @project_status.user_id
    click_on "Create Project status"

    assert_text "Project status was successfully created"
    click_on "Back"
  end

  test "should update Project status" do
    visit project_status_url(@project_status)
    click_on "Edit this project status", match: :first

    fill_in "Project", with: @project_status.project_id
    fill_in "Status", with: @project_status.status
    fill_in "User", with: @project_status.user_id
    click_on "Update Project status"

    assert_text "Project status was successfully updated"
    click_on "Back"
  end

  test "should destroy Project status" do
    visit project_status_url(@project_status)
    click_on "Destroy this project status", match: :first

    assert_text "Project status was successfully destroyed"
  end
end
