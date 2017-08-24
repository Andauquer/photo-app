class WelcomeController < ApplicationController
  
  # Definimos que before_action, declarado en application_controller no se tomara en cuenta
  # para la accion index.
  skip_before_action :authenticate_user!, only: [:index]
  
  def index
  
  end

end
