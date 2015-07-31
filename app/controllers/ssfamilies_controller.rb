class SsfamiliesController < ApplicationController
  before_action :set_ssfamily, only: [:show, :edit, :update, :destroy]

  # GET /ssfamilies
  # GET /ssfamilies.json
  def index
    @ssfamilies = Ssfamily.all
  end

  # GET /ssfamilies/1
  # GET /ssfamilies/1.json
  def show
  end

  # GET /ssfamilies/new
  def new
    @ssfamily = Ssfamily.new
  end

  # GET /ssfamilies/1/edit
  def edit
  end

  # POST /ssfamilies
  # POST /ssfamilies.json
  def create
    @ssfamily = Ssfamily.new(ssfamily_params)

    respond_to do |format|
      if @ssfamily.save
        format.html { redirect_to @ssfamily, notice: 'Ssfamily was successfully created.' }
        format.json { render :show, status: :created, location: @ssfamily }
      else
        format.html { render :new }
        format.json { render json: @ssfamily.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ssfamilies/1
  # PATCH/PUT /ssfamilies/1.json
  def update
    respond_to do |format|
      if @ssfamily.update(ssfamily_params)
        format.html { redirect_to @ssfamily, notice: 'Ssfamily was successfully updated.' }
        format.json { render :show, status: :ok, location: @ssfamily }
      else
        format.html { render :edit }
        format.json { render json: @ssfamily.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ssfamilies/1
  # DELETE /ssfamilies/1.json
  def destroy
    @ssfamily.destroy
    respond_to do |format|
      format.html { redirect_to ssfamilies_url, notice: 'Ssfamily was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ssfamily
      @ssfamily = Ssfamily.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ssfamily_params
      params.require(:ssfamily).permit(:nombre, :desc, :sfamily_id)
    end
end
