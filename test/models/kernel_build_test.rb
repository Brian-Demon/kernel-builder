require "test_helper"
require "tempfile"

class KernelBuildTest < ActiveSupport::TestCase
  setup do
    KernelSource.destroy_all
    KernelConfig.destroy_all
    KernelBuild.destroy_all

    @user = User.create(
      provider: "github",
      uid: "1",
      username: "test_user"
    )

    @filename = "text.txt"
  end
  
  def createFile(filename)
    Tempfile.create { |f| f << filename }
  end

  def createConfigUrl(file)
    @config_url = ActiveStorage::Blob.create_and_upload!(
      io: file,
      filename: file.path,
      content_type: "text/plain",
    )
  end

  def existingKernelConfig
    file = Tempfile.new(@filename)
    KernelConfig.new(user: @user, config_url: createConfigUrl(file))
  end

  def existingKernelSource
    KernelSource.new(
      user: @user,
      git_repo: "github.com/test_user/test_repo_1",
      git_ref: "a12bcd3"
    )
  end

  def newKernelConfig(filename)
    file = Tempfile.new(@filename)
    KernelConfig.new(user: @user, config_url: createConfigUrl(file))
  end

  def newKernelSource(git_repo, git_ref)
    KernelSource.new(user: @user, git_repo: git_repo, git_ref: git_ref)
  end

  def kernelBuild(user, kernel_config, kernel_source)
    KernelBuild.new(
      user: user,
      kernel_config: kernel_config,
      kernel_source: kernel_source,
    )
  end

  test "user can create a new kernel build with existing kernel_config and existing kernel_source" do
    kernel_config = existingKernelConfig
    kernel_source = existingKernelSource

    assert kernel_config.valid?
    assert kernel_config.errors[:body].empty?
    assert kernel_source.valid?
    assert kernel_source.errors[:body].empty?

    kernel_build = kernelBuild(@user, kernel_config, kernel_source)
    kernel_build.save

    assert kernel_build.valid?
    assert kernel_build.errors[:body].empty?

    assert_equal 1, KernelConfig.count
    assert_equal 1, KernelSource.count
    assert_equal 1, KernelBuild.count
  end

  test "user can create a new kernel build with existing kernel_config and new kernel_source" do
    kernel_config = existingKernelConfig
    kernel_source = newKernelSource(
      "github.com/test_user/test_repo_2",
      "e45fgh6"
    )

    assert kernel_config.valid?
    assert kernel_config.errors[:body].empty?
    assert kernel_source.valid?
    assert kernel_source.errors[:body].empty?

    kernel_build = kernelBuild(@user, kernel_config, kernel_source)
    kernel_build.save

    assert kernel_build.valid?
    assert kernel_build.errors[:body].empty?

    assert_equal 1, KernelConfig.count
    assert_equal 1, KernelSource.count
    assert_equal 1, KernelBuild.count
  end

  test "user can create a new kernel build with new kernel_config and existing kernel_source" do
    kernel_config = newKernelConfig("test_file_2.txt")
    kernel_source = existingKernelSource

    assert kernel_config.valid?
    assert kernel_config.errors[:body].empty?
    assert kernel_source.valid?
    assert kernel_source.errors[:body].empty?

    kernel_build = kernelBuild(@user, kernel_config, kernel_source)
    kernel_build.save

    assert kernel_build.valid?
    assert kernel_build.errors[:body].empty?

    assert_equal 1, KernelConfig.count
    assert_equal 1, KernelSource.count
    assert_equal 1, KernelBuild.count
  end

  test "user can create a new kernel build with new kernel_config and new kernel_source" do
    kernel_config = newKernelConfig("test_file_3.txt")
    kernel_source = newKernelSource(
      "github.com/test_user/test_repo_3",
      "i78jkl9"
    )

    assert kernel_config.valid?
    assert kernel_config.errors[:body].empty?
    assert kernel_source.valid?
    assert kernel_source.errors[:body].empty?

    kernel_build = kernelBuild(@user, kernel_config, kernel_source)
    kernel_build.save
    
    assert kernel_build.valid?
    assert kernel_build.errors[:body].empty?

    assert_equal 1, KernelConfig.count
    assert_equal 1, KernelSource.count
    assert_equal 1, KernelBuild.count
  end

  test "user cannot create a new kernel build with new kernel_config and no kernel_source" do
    kernel_config = newKernelConfig("test_file_4.txt")

    assert kernel_config.valid?
    assert kernel_config.errors[:body].empty?

    kernel_build = kernelBuild(@user, kernel_config, nil)
    kernel_build.save

    refute kernel_build.valid?
    assert kernel_build.errors[:body].empty?

    assert_equal 0, KernelConfig.count
    assert_equal 0, KernelSource.count
    assert_equal 0, KernelBuild.count
  end

  test "user cannot create a new kernel build with new kernel_source and no kernel_config" do
    kernel_source = newKernelSource(
      "github.com/test_user/test_repo_4",
      "m01nop2"
    )

    assert kernel_source.valid?
    assert kernel_source.errors[:body].empty?

    kernel_build = kernelBuild(@user, nil, kernel_source)
    kernel_build.save

    refute kernel_build.valid?
    assert kernel_build.errors[:body].empty?

    assert_equal 0, KernelConfig.count
    assert_equal 0, KernelSource.count
    assert_equal 0, KernelBuild.count
  end

  test "user cannot create a new kernel build with no kernel_config and no kernel_source" do
    kernel_build = kernelBuild(@user, nil, nil)
    kernel_build.save

    refute kernel_build.valid?
    assert kernel_build.errors[:body].empty?

    assert_equal 0, KernelConfig.count
    assert_equal 0, KernelSource.count
    assert_equal 0, KernelBuild.count
  end
end
