require "test_helper"

class KernelSourcesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @kernel_source = kernel_sources(:one)
  end

  test "should get index" do
    get kernel_sources_url
    assert_response :success
  end

  test "should get new" do
    get new_kernel_source_url
    assert_response :success
  end

  test "should create kernel_source" do
    assert_difference('KernelSource.count') do
      post kernel_sources_url, params: { kernel_source: { git_ref: @kernel_source.git_ref, git_repo: @kernel_source.git_repo } }
    end

    assert_redirected_to kernel_source_url(KernelSource.last)
  end

  test "should show kernel_source" do
    get kernel_source_url(@kernel_source)
    assert_response :success
  end

  test "should get edit" do
    get edit_kernel_source_url(@kernel_source)
    assert_response :success
  end

  test "should update kernel_source" do
    patch kernel_source_url(@kernel_source), params: { kernel_source: { git_ref: @kernel_source.git_ref, git_repo: @kernel_source.git_repo } }
    assert_redirected_to kernel_source_url(@kernel_source)
  end

  test "should destroy kernel_source" do
    assert_difference('KernelSource.count', -1) do
      delete kernel_source_url(@kernel_source)
    end

    assert_redirected_to kernel_sources_url
  end
end
