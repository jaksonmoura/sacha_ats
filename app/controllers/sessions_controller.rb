class SessionsController < ApplicationController
  require 'bcrypt'
  skip_before_filter :authenticate_user
  skip_before_filter :authenticate_admin
  
  def new
  end
    
  def create
    if admin?
      session[:logged] = 1
      session[:admin] = 1
      session[:technical_id] = @adminuser.id
      redirect_to calls_path, notice: "Bem-vindo, Administrador!"
    elsif authenticated?
      session[:logged] = 1
      session[:technical_id] = @bduser.id
      redirect_to calls_path, notice: "Bem-vindo, #{@bduser.name}!"
    else
      render action: 'new', notice: 'Nome de usuário ou senha inválidos.'
    end  
  end  
  
  def destroy  
    session[:logged] = nil
    session[:admin] = nil
    redirect_to login_path, notice: 'Você saiu.'
  end

  private

    def admin?
      user, password = params[:nickname], params[:password]
      @adminuser = Technical.find_by_nickname(user)
      @adminuser && @adminuser.authenticate(password) && @adminuser.admin == true
    end

    def authenticated?
      user, password = params[:nickname], params[:password]
      @bduser = Technical.find_by_nickname(user)
      @bduser && @bduser.authenticate(password) && @bduser.admin == false
    end



end