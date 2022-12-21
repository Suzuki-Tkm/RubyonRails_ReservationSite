class ApplicationController < ActionController::Base
  private def current_member
    Member.find_by(id: session[:member_id]) if session[:member_id]
  end
  helper_method :current_member

  private def current_administrator
    Administrator.find_by(id: session[:administrator_id]) if session[:administrator_id]
  end
  helper_method :current_administrator

  private def current_brand
    Administrator.find_by(id: session[:brand_id]) if session[:brand_id]
  end
  helper_method :current_brand

  class LoginRequired < StandardError; end
  class Forbidden < StandardError; end

  if Rails.env.production? || ENV["RESCUE_EXCEPTIONS"]
    rescue_from StandardError, with: :rescue_internal_server_error
    rescue_from ActiveRecord::RecordNotFound, with: :rescue_not_found
    rescue_from ActionController::ParameterMissing, with: :rescue_bad_request
  end

  rescue_from LoginRequired, with: :rescue_login_required
  rescue_from Forbidden, with: :rescue_forbidden

  private def member_login_required
    raise LoginRequired unless current_member
  end

  private def brand_login_required
    raise LoginRequired unless current_brand
  end

  private def administrator_login_required
    raise LoginRequired unless current_administrator
  end

  private def rescue_bad_request(exception)
    render "errors/bad_request", status: 400, layout: "error",
      formats: [:html]
  end

  private def rescue_login_required(exception)
    render "errors/login_required", status: 403, layout: "error",
      formats: [:html]
  end

  private def rescue_forbidden(exception)
    render "errors/forbidden", status: 403, layout: "error",
      formats: [:html]
  end

  private def rescue_not_found(exception)
    render "errors/not_found", status: 404, layout: "error",
      formats: [:html]
  end

  private def rescue_internal_server_error(exception)
    render "errors/internal_server_error", status: 500, layout: "error",
      formats: [:html]
  end
end
