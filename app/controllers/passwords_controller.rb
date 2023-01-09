class PasswordsController < ApplicationController
  before_action :member_login_required , only: [:show , :edit , :update]
  before_action :admin_login_required ,  only: [:admin_show , :admin_edit , :admin_update]
  
  def show
    redirect_to :account
  end

  def edit
    @member = current_member
  end

  def update
    @member = current_member
    current_password = params[:account][:current_password]

    if current_password.present?
      if @member.authenticate(current_password)
        @member.assign_attributes(params[:account])
        if @member.save
          redirect_to :account, notice: "パスワードを変更しました。"
        else
          render "edit"
        end
      else
        @member.errors.add(:current_password, :wrong)
        render "edit"
      end
    else
      @member.errors.add(:current_password, :empty)
      render "edit"
    end
  end

  def admin_show
    redirect_to :admin_show_account
  end

  def admin_edit
    @admin
    if current_administrator
      @admin = current_administrator
    elsif current_brand
      @admin = current_brand
    end
  end

  def admin_update
    @admin
    if current_administrator
      @admin = current_administrator
    elsif current_brand
      @admin = current_brand
    end

    current_password = params[:account][:current_password]

    if current_password.present?
      if @admin.authenticate(current_password)
        @admin.assign_attributes(params[:account])
        if @admin.save
          redirect_to :admin_show_account , notice: "パスワードを変更しました。"
        else
          render "admin_edit"
        end
      else
        @admin.errors.add(:current_password, :wrong)
        render "admin_edit"
      end
    else
      @admin.errors.add(:current_password, :empty)
      render "admin_edit"
    end
  end
end
