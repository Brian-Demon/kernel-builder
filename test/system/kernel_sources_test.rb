require "application_system_test_case"

class KernelSourcesTest < ApplicationSystemTestCase
  setup do
    @kernel_source = kernel_sources(:one)
  end

  test "visiting the index" do
    visit kernel_sources_url
    assert_selector "h1", text: "Kernel Sources"
  end

  test "creating a Kernel source" do
    visit kernel_sources_url
    click_on "New Kernel Source"

    fill_in "Git ref", with: @kernel_source.git_ref
    fill_in "Git repo", with: @kernel_source.git_repo
    click_on "Create Kernel"

    assert_text "Kernel source was successfully created"
    click_on "Back"
  end

  test "updating a Kernel source" do
    visit kernel_sources_url
    click_on "Edit", match: :first

    fill_in "Git ref", with: @kernel_source.git_ref
    fill_in "Git repo", with: @kernel_source.git_repo
    click_on "Update Kernel source"

    assert_text "Kernel source was successfully updated"
    click_on "Back"
  end

  test "destroying a Kernel source" do
    visit kernel_sources_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Kernel source was successfully destroyed"
  end
end
