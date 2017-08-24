class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # Para ingresar a la aplicacion primero el usuario debe ser autenticado.
  before_action :authenticate_user!
end
