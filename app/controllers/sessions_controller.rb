class SessionsController < ApplicationController
  skip_before_filter :authenticate_user
  skip_before_filter :authenticate_admin
  require 'bcrypt'
  
  def new
  end
    
  def create
    if admin?
      session[:servant] = 0
      redirect_to root_path, notice: "Bem-vindo, #{@bduser.name}!"
    elsif authenticated?
      session[:servant] = 1
      redirect_to root_path, notice: "Bem-vindo, Administrador!"
    else
      render action: 'new', notice: 'Nome de usuário ou senha inválidos.'
    end  
  end  
  
  def destroy  
    session[:servant] = nil
    redirect_to login_path, notice: 'Você saiu.'
  end

  private

    def admin?
      user, password = params[:nickname], params[:password]
      bduser = Technical.find_by_nickname(params[:nickname])
      bduser && bduser.authenticate(params[:password]) && bduser.admin == 1
    end

    def authenticated?
      user, password = params[:nickname], params[:password]
      bduser = Technical.find_by_nickname(params[:nickname])
      bduser && bduser.authenticate(params[:password])
    end

end