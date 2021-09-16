class KernelBuildsController < ApplicationController
  before_action :require_user_logged_in!
  before_action :set_kernel_build, only: %i[ show edit update destroy ]

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
    @current_user_kernel_configs ||= KernelConfig.where(user_id: current_user.id).distinct
    @current_user_kernel_sources ||= KernelSource.where(user_id: current_user.id).distinct
  end

  # GET /kernel_builds/1/edit
  def edit
    @current_user_kernel_configs ||= KernelConfig.where(user_id: current_user.id).distinct
    @current_user_kernel_sources ||= KernelSource.where(user_id: current_user.id).distinct
  end

  # POST /kernel_builds or /kernel_builds.json
  def create
    @kernel_build = KernelBuild.new(kernel_build_params)

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
      params.require(:kernel_build).permit(:kernel_id, :config_id, :artifact_url, kernel_configs_attributes: [:config_url], kernel_sources_attributes: [:git_repo, :git_ref])
    end
end
