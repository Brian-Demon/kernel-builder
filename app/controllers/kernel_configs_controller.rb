class KernelConfigsController < ApplicationController
  before_action :set_kernel_config, only: %i[ show edit update destroy ]

  # GET /kernel_configs or /kernel_configs.json
  def index
    @kernel_configs = KernelConfig.all
  end

  # GET /kernel_configs/1 or /kernel_configs/1.json
  def show
  end

  # GET /kernel_configs/new
  def new
    @kernel_config = KernelConfig.new
  end

  # GET /kernel_configs/1/edit
  def edit
  end

  # POST /kernel_configs or /kernel_configs.json
  def create
    @kernel_config = KernelConfig.new(user_id: current_user.id, config_url: params[:config_url])

    respond_to do |format|
      if @kernel_config.save
        format.html { redirect_to @kernel_config, notice: "Kernel config was successfully created." }
        format.json { render :show, status: :created, location: @kernel_config }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @kernel_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kernel_configs/1 or /kernel_configs/1.json
  def update
    respond_to do |format|
      if @kernel_config.update(kernel_config_params)
        format.html { redirect_to @kernel_config, notice: "Kernel config was successfully updated." }
        format.json { render :show, status: :ok, location: @kernel_config }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @kernel_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kernel_configs/1 or /kernel_configs/1.json
  def destroy
    @kernel_config.destroy
    respond_to do |format|
      format.html { redirect_to kernel_configs_url, notice: "Kernel config was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kernel_config
      @kernel_config = KernelConfig.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def kernel_config_params
      params.require(:kernel_config).permit(:user_id, :config_url)
    end
end
