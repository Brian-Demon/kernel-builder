require "application_system_test_case"

class KernelConfigsTest < ApplicationSystemTestCase
  setup do
    @kernel_config = kernel_configs(:one)
  end

  test "visiting the index" do
    visit kernel_configs_url
    assert_selector "h1", text: "Kernel Configs"
  end

  test "creating a Kernel config" do
    visit kernel_configs_url
    click_on "New Kernel Config"

    fill_in "User", with: @kernel_config.user_id
    click_on "Create Kernel config"

    assert_text "Kernel config was successfully created"
    click_on "Back"
  end

  test "updating a Kernel config" do
    visit kernel_configs_url
    click_on "Edit", match: :first

    fill_in "User", with: @kernel_config.user_id
    click_on "Update Kernel config"

    assert_text "Kernel config was successfully updated"
    click_on "Back"
  end

  test "destroying a Kernel config" do
    visit kernel_configs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Kernel config was successfully destroyed"
  end
end
