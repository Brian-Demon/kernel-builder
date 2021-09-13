require "test_helper"

class KernelBuildsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @kernel_build = kernel_builds(:one)
  end

  test "should get index" do
    get kernel_builds_url
    assert_response :success
  end

  test "should get new" do
    get new_kernel_build_url
    assert_response :success
  end

  test "should create kernel_build" do
    assert_difference('KernelBuild.count') do
      post kernel_builds_url, params: { kernel_build: { artifact_url: @kernel_build.artifact_url, config_id: @kernel_build.config_id, kernel_id: @kernel_build.kernel_id } }
    end

    assert_redirected_to kernel_build_url(KernelBuild.last)
  end

  test "should show kernel_build" do
    get kernel_build_url(@kernel_build)
    assert_response :success
  end

  test "should get edit" do
    get edit_kernel_build_url(@kernel_build)
    assert_response :success
  end

  test "should update kernel_build" do
    patch kernel_build_url(@kernel_build), params: { kernel_build: { artifact_url: @kernel_build.artifact_url, config_id: @kernel_build.config_id, kernel_id: @kernel_build.kernel_id } }
    assert_redirected_to kernel_build_url(@kernel_build)
  end

  test "should destroy kernel_build" do
    assert_difference('KernelBuild.count', -1) do
      delete kernel_build_url(@kernel_build)
    end

    assert_redirected_to kernel_builds_url
  end
end
