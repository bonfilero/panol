class OutputsController < ApplicationController
  before_action :set_output, only: [:show, :edit, :update, :destroy]

  include ActualizarSaldo

  # GET /outputs
  # GET /outputs.json
  def index
    @outputs = Output.all
  end

  # GET /outputs/1
  # GET /outputs/1.json
  def show
  end

  # GET /outputs/new
  def new
    @output = Output.new
    @article = Article.find(params[:article_id])
    
    equipments = Equipment.all
    @opciones_equipo = Array.new
    
    equipments.each do |equipo|
      arr = [equipo.nombre,equipo.id]
      @opciones_equipo << arr
    end

    operarios = Worker.all
    @opciones_operario = Array.new

    operarios.each do |operario|
      arr = [operario.nombre,operario.legajo]
      @opciones_operario << arr      
    end


  end

  def new_output
    @article_id = params[:article_id]
    @article = Article.find(@article_id)
    @output = Output.new
  end



  # GET /outputs/1/edit
  def edit
  end

  # POST /outputs
  # POST /outputs.json
  def create
    @article = Article.find(params[:article_id])
    @output = @article.outputs.new(output_params)

    respond_to do |format|
      if @output.save
        format.html { redirect_to outputs_path, notice: 'Output was successfully created.' }
        format.json { render :show, status: :created, location: @output }
        actualizar_saldo(@article.id,output_params[:cantidad],"output",@output.id)

      else
        format.html { render :new }
        format.json { render json: @output.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /outputs/1
  # PATCH/PUT /outputs/1.json
  def update
    raise to_yaml
    respond_to do |format|
      if @output.update(output_params)
        format.html { redirect_to @output, notice: 'Output was successfully updated.' }
        format.json { render :show, status: :ok, location: @output }
      else
        format.html { render :edit }
        format.json { render json: @output.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /outputs/1
  # DELETE /outputs/1.json
  def destroy
    @output.destroy
    respond_to do |format|
      format.html { redirect_to outputs_url, notice: 'Output was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_output
      @output = Output.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def output_params
      params.require(:output).permit(:cantidad, :article_id, :worker_id, :equipment_id)
    end
end
