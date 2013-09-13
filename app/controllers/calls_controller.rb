class CallsController < ApplicationController
  before_action :set_call, only: [:show, :edit, :update, :destroy]
  skip_before_filter :authenticate_user, only: [:new, :create]

  # GET /calls
  # GET /calls.json
  def index
    @calls = Call.where("closed = ?", false).order('updated_at DESC')
  end

  # GET /calls/1
  # GET /calls/1.json
  def show
  end

  # GET /calls/new
  def new
    @call = Call.new
    @dptos = ActiveRecord::Base.connection.exec_query("SELECT * FROM dados_ats.dpto")
  end

  # GET /calls/1/edit
  def edit
  end

  # POST /calls
  # POST /calls.json
  def create
    @call = Call.new(call_params)
    # Repetido aqui, para que os erros possam ser mostrados se houver.
    @dptos = ActiveRecord::Base.connection.exec_query("SELECT * FROM dados_ats.dpto")
    respond_to do |format|
      if @call.save
        format.html { redirect_to @call, notice: 'Chamada criada.' }
        format.json { render action: 'saved', status: :created, location: @call }
      else
        format.html { render action: 'new' }
        format.json { render json: @call.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calls/1
  # PATCH/PUT /calls/1.json
  def update
    respond_to do |format|
      if @call.update(call_params)
        format.html { redirect_to @call, notice: 'Chamada alterada.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @call.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calls/1
  # DELETE /calls/1.json
  def destroy
    @call.destroy
    respond_to do |format|
      format.html { redirect_to calls_url }
      format.json { head :no_content }
    end
  end

  # GET /calls/saved
  def saved
  end

  # GET /calls/1/close
  def close
    @call = Call.find(params[:id])
  end

  # PATCH/PUT /calls/1/done
  def done
    @call = Call.find(params[:id])
    if @call.service != nil
      @call.closed = true
      @call.update(call_params)
      redirect_to '/', notice: 'A chamada nº #{@call.id} foi fechado.'
    else
      redirect_to close_path(@call), notice: "Você precisa preencher todos os campos requeridos para salvar."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_call
      @call = Call.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def call_params
      params.require(:call).permit(:dpto_id, :servant_id, :technical_id, :equipment, :problem, :service, :obs, :closed)
    end
end