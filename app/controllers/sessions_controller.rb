class SessionsController < ApplicationController
  def create
    member = Member.find_by(email: params[:email])
    administrator = Administrator.find_by(email: params[:email])
    if member&.authenticate(params[:password])
      session[:member_id] = member.id
    elsif administrator&.authenticate(params[:password]) && administrator.brand_id == nil
      session[:administrator_id] = administrator.id
    elsif administrator&.authenticate(params[:password])
      session[:brand_id] = administrator.id
    else
      flash.alert = "メールアドレスとパスワードが一致しません"
    end
    redirect_to :root
  end

  def destroy
    if current_member
      session.delete(:member_id)
    elsif current_administrator
      session.delete(:administrator_id)
    elsif current_brand
      session.delete(:brand_id)
    end
    redirect_to :root
  end
end
