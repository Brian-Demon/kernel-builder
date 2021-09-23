class KernelBuildsController < ApplicationController
  before_action :require_user_logged_in!
  before_action :set_kernel_build, only: %i[ show edit update destroy ]
  before_action :set_user_kernel_configs
  before_action :set_user_kernel_sources

  # GET /kernel_builds or /kernel_builds.json
  def index
    @kernel_builds = KernelBuild.all
  end

  # GET /kernel_builds/1 or /kernel_builds/1.json
  def show
  end

  # GET /kernel_builds/new
  def new
    @kernel_build = KernelBuild.new
  end

  # GET /kernel_builds/1/edit
  def edit
  end

  # POST /kernel_builds or /kernel_builds.json
  def create
    if params["kernel_config"]["id"].present?
      kernel_config = KernelConfig.find(params["kernel_config"]["id"])
    else
      config_url = params["kernel_build"]["config_url"]
      kernel_config = KernelConfig.new(config_url: config_url, user: current_user)
    end

    if params["kernel_source"]["id"].present?
      kernel_source = KernelSource.find(params["kernel_source"]["id"])
    else
      git_repo = params["kernel_build"]["git_repo"]
      git_ref = params["kernel_build"]["git_ref"]
      kernel_source = KernelSource.new(git_repo: git_repo, git_ref: git_ref, user: current_user)
    end

    # @kernel_build = KernelBuild.new(kernel_build_params)
    @kernel_build = KernelBuild.new(
      user: current_user,
      kernel_config: kernel_config,
      kernel_source: kernel_source,
    )

    respond_to do |format|
      if @kernel_build.save
        format.html { redirect_to @kernel_build, notice: "Kernel build was successfully created." }
        format.json { render :show, status: :created, location: @kernel_build }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @kernel_build.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kernel_builds/1 or /kernel_builds/1.json
  def update
    respond_to do |format|
      if @kernel_build.update(kernel_build_params)
        format.html { redirect_to @kernel_build, notice: "Kernel build was successfully updated." }
        format.json { render :show, status: :ok, location: @kernel_build }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @kernel_build.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kernel_builds/1 or /kernel_builds/1.json
  def destroy
    @kernel_build.destroy
    respond_to do |format|
      format.html { redirect_to kernel_builds_url, notice: "Kernel build was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kernel_build
      @kernel_build = KernelBuild.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def kernel_build_params
      params.require(:kernel_build).permit(:kernel_source_id, :kernel_config_id, :artifact_url, kernel_configs_attributes: [:config_url], kernel_sources_attributes: [:git_repo, :git_ref])
    end

    # Set collections for kernel_sources and kernel_configs
    def set_user_kernel_configs
      @current_user_kernel_configs ||= current_user.kernel_configs.distinct
    end

    def set_user_kernel_sources
      @current_user_kernel_sources ||= current_user.kernel_sources.distinct
    end
end
