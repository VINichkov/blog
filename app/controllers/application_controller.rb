class ApplicationController < ActionController::Base

  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from CanCan::AccessDenied, with: :not_found
  rescue_from ArgumentError, with: :not_found

  def current_ability
    @current_ability ||= Ability.new(current_user)
  end


  def not_found
    render "errors/error_404", status: :not_found, formats: :html
  end
end
