class SsystemsController < ApplicationController
  before_action :set_ssystem, only: [:show, :edit, :update, :destroy]

  # GET /ssystems
  # GET /ssystems.json
  def index
    @ssystems = Ssystem.all
  end

  # GET /ssystems/1
  # GET /ssystems/1.json
  def show
  end

  # GET /ssystems/new
  def new
    @ssystem = Ssystem.new
  end

  # GET /ssystems/1/edit
  def edit
  end

  # POST /ssystems
  # POST /ssystems.json
  def create
    @ssystem = Ssystem.new(ssystem_params)

    respond_to do |format|
      if @ssystem.save
        format.html { redirect_to @ssystem, notice: 'Ssystem was successfully created.' }
        format.json { render :show, status: :created, location: @ssystem }
      else
        format.html { render :new }
        format.json { render json: @ssystem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ssystems/1
  # PATCH/PUT /ssystems/1.json
  def update
    respond_to do |format|
      if @ssystem.update(ssystem_params)
        format.html { redirect_to @ssystem, notice: 'Ssystem was successfully updated.' }
        format.json { render :show, status: :ok, location: @ssystem }
      else
        format.html { render :edit }
        format.json { render json: @ssystem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ssystems/1
  # DELETE /ssystems/1.json
  def destroy
    @ssystem.destroy
    respond_to do |format|
      format.html { redirect_to ssystems_url, notice: 'Ssystem was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ssystem
      @ssystem = Ssystem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ssystem_params
      params.require(:ssystem).permit(:nombre, :system_id)
    end
end
