class TechnicalsController < ApplicationController
  before_action :set_technical, only: [:show, :edit, :update, :destroy]
  skip_before_filter :authenticate_user, only: [:index, :new, :create, :new_admin, :create_admin]
  before_filter :authenticate_admin, only: [:index, :new, :create]
  before_filter :can_edit, only: [:edit, :update]


  # GET /technicals
  # GET /technicals.json
  def index
    @technicals = Technical.all
  end

  # GET /technicals/1
  # GET /technicals/1.json
  def show
    @calls = Call.where("technical_id = ? and closed = ?", @technical.id, true)
    @dptos = ActiveRecord::Base.connection.exec_query("SELECT * FROM dados_ats.dpto")
  end

  # GET /technicals/new
  def new
    @technical = Technical.new
  end

  # GET /technicals/1/edit
  def edit
  end

  # POST /technicals
  # POST /technicals.json
  def create
    @technical = Technical.new(technical_params)

    respond_to do |format|
      if @technical.save
        format.html { redirect_to @technical, notice: 'Técnico cadastrado com sucesso.' }
        format.json { render action: 'show', status: :created, location: @technical }
      else
        format.html { render action: 'new' }
        format.json { render json: @technical.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /technicals/1
  # PATCH/PUT /technicals/1.json
  def update
    respond_to do |format|
      if @technical.update(technical_params)
        format.html { redirect_to @technical, notice: 'Alterado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @technical.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /technicals/1
  # DELETE /technicals/1.json
  def destroy
    @technical.destroy
    respond_to do |format|
      format.html { redirect_to technicals_url }
      format.json { head :no_content }
    end
  end

  def new_admin
    @admin = Technical.where("admin = ?", true).count
    @technical = Technical.new
  end

  def create_admin
    @technical = Technical.new(technical_params)
    @admin = Technical.where("admin = ?", true).count
    @technical.admin = true

    respond_to do |format|
      if @technical.save
        format.html { redirect_to login_path, notice: 'Administrador cadastrado com sucesso.' }
        format.json { render action: 'show', status: :created, location: @technical }
      else
        format.html { render action: 'new_admin' }
        format.json { render json: @technical.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_technical
      @technical = Technical.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def technical_params
      params.require(:technical).permit(:name, :nickname, :password, :password_digest, :admin, :password_confirmation)
    end

    def admin?
      current_technical.admin
    end

    def can_edit
      if current_technical.id != @technical.id && admin? == false
        redirect_to login_path, notice: 'Você precisa logar como administrador!'
      end
    end

end
