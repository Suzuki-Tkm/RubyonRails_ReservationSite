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
end
