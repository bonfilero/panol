class SfamiliesController < ApplicationController
  before_action :set_sfamily, only: [:show, :edit, :update, :destroy]

  # GET /sfamilies
  # GET /sfamilies.json
  def index
    @sfamilies = Sfamily.all
  end

  # GET /sfamilies/1
  # GET /sfamilies/1.json
  def show
  end

  # GET /sfamilies/new
  def new
    @sfamily = Sfamily.new
  end

  # GET /sfamilies/1/edit
  def edit
  end

  # POST /sfamilies
  # POST /sfamilies.json
  def create
    @sfamily = Sfamily.new(sfamily_params)

    respond_to do |format|
      if @sfamily.save
        format.html { redirect_to @sfamily, notice: 'Sfamily was successfully created.' }
        format.json { render :show, status: :created, location: @sfamily }
      else
        format.html { render :new }
        format.json { render json: @sfamily.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sfamilies/1
  # PATCH/PUT /sfamilies/1.json
  def update
    respond_to do |format|
      if @sfamily.update(sfamily_params)
        format.html { redirect_to @sfamily, notice: 'Sfamily was successfully updated.' }
        format.json { render :show, status: :ok, location: @sfamily }
      else
        format.html { render :edit }
        format.json { render json: @sfamily.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sfamilies/1
  # DELETE /sfamilies/1.json
  def destroy
    @sfamily.destroy
    respond_to do |format|
      format.html { redirect_to sfamilies_url, notice: 'Sfamily was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sfamily
      @sfamily = Sfamily.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sfamily_params
      params.require(:sfamily).permit(:nombre, :desc, :family_id)
    end
end
