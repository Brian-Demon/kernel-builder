class KernelSourcesController < ApplicationController
  before_action :set_kernel_source, only: %i[ show edit update destroy ]

  # GET /kernel_sources or /kernel_sources.json
  def index
    @kernel_sources = KernelSource.all
  end

  # GET /kernel_sources/1 or /kernel_sources/1.json
  def show
  end

  # GET /kernel_sources/new
  def new
    @kernel_source = KernelSource.new
  end

  # GET /kernel_sources/1/edit
  def edit
  end

  # POST /kernel_sources or /kernel_sources.json
  def create
    @kernel_source = KernelSource.new(kernel_source_params)

    respond_to do |format|
      if @kernel_source.save
        format.html { redirect_to @kernel_source, notice: "Kernel source was successfully created." }
        format.json { render :show, status: :created, location: @kernel_source }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @kernel_source.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kernel_sources/1 or /kernel_sources/1.json
  def update
    respond_to do |format|
      if @kernel_source.update(kernel_source_params)
        format.html { redirect_to @kernel_source, notice: "Kernel source was successfully updated." }
        format.json { render :show, status: :ok, location: @kernel_source }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @kernel_source.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kernel_sources/1 or /kernel_sources/1.json
  def destroy
    @kernel_source.destroy
    respond_to do |format|
      format.html { redirect_to kernel_sources_url, notice: "Kernel source was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kernel_source
      @kernel_source = KernelSource.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def kernel_source_params
      params.require(:kernel_source).permit(:git_repo, :git_ref)
    end
end
