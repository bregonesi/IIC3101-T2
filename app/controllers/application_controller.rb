class ApplicationController < ActionController::API
  #protect_from_forgery with: :exception
  include ExceptionHandler
end
