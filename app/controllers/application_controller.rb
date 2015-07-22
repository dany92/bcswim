class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  def home
  	render text: "welcome to BC Swim team page"
  	end
  protect_from_forgery with: :exception
end
