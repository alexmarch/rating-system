require 'themoviedb'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  helper :all
  
  protect_from_forgery with: :exception
  
  rescue_from "MainPageController::Forbidden", with: :forbidden

  before_action :authenticate

  Tmdb::Api.key("8a221fc31fcdf12a8af827465574ffc9")
  
  private

  def authenticate
    @configuration = Tmdb::Configuration.new
  end
  
  def forbidden(exception)
    render text: exception
  end

end
