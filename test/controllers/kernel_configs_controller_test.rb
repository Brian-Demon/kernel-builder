require "test_helper"

class KernelConfigsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @kernel_config = kernel_configs(:one)
  end

  test "should get index" do
    get kernel_configs_url
    assert_response :success
  end

  test "should get new" do
    get new_kernel_config_url
    assert_response :success
  end

  test "should create kernel_config" do
    assert_difference('KernelConfig.count') do
      post kernel_configs_url, params: { kernel_config: { user_id: @kernel_config.user_id } }
    end

    assert_redirected_to kernel_config_url(KernelConfig.last)
  end

  test "should show kernel_config" do
    get kernel_config_url(@kernel_config)
    assert_response :success
  end

  test "should get edit" do
    get edit_kernel_config_url(@kernel_config)
    assert_response :success
  end

  test "should update kernel_config" do
    patch kernel_config_url(@kernel_config), params: { kernel_config: { user_id: @kernel_config.user_id } }
    assert_redirected_to kernel_config_url(@kernel_config)
  end

  test "should destroy kernel_config" do
    assert_difference('KernelConfig.count', -1) do
      delete kernel_config_url(@kernel_config)
    end

    assert_redirected_to kernel_configs_url
  end
end
