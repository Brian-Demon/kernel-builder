require "application_system_test_case"

class KernelBuildsTest < ApplicationSystemTestCase
  setup do
    @kernel_build = kernel_builds(:one)
  end

  test "visiting the index" do
    visit kernel_builds_url
    assert_selector "h1", text: "Kernel Builds"
  end

  test "creating a Kernel build" do
    visit kernel_builds_url
    click_on "New Kernel Build"

    fill_in "Artifact url", with: @kernel_build.artifact_url
    fill_in "Config", with: @kernel_build.config_id
    fill_in "Kernel", with: @kernel_build.kernel_id
    click_on "Create Kernel build"

    assert_text "Kernel build was successfully created"
    click_on "Back"
  end

  test "updating a Kernel build" do
    visit kernel_builds_url
    click_on "Edit", match: :first

    fill_in "Artifact url", with: @kernel_build.artifact_url
    fill_in "Config", with: @kernel_build.config_id
    fill_in "Kernel", with: @kernel_build.kernel_id
    click_on "Update Kernel build"

    assert_text "Kernel build was successfully updated"
    click_on "Back"
  end

  test "destroying a Kernel build" do
    visit kernel_builds_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Kernel build was successfully destroyed"
  end
end
