class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def index

  end

  def current_user
    Trainer.find_by(id: session[:current_user])
  end

  def safari_zone
    @pokemon = Pokemon.find(params[:id])
    render :json => @pokemon
  end

end
