class ApplicationController < ActionController::Base
  before_filter :authenticate_user
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

    def authenticate_user
      if session[:logged] != 1 || session[:logged].nil?
        redirect_to login_path, notice: 'Você precisa logar!'
      end
    end

    def authenticate_admin
      if session[:logged] != 1 || session[:admin] != 1 || session[:logged].nil?
        redirect_to login_path, notice: 'Você precisa logar como administrador!'
      end
    end

    def current_technical
      Technical.find(session[:technical_id])
    end

end
