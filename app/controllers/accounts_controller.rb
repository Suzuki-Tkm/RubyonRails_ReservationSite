class AccountsController < ApplicationController
  before_action :member_login_required , only: [:show , :edit , :update]
  before_action :admin_login_required ,  only: [:admin_show , :admin_edit , :admin_update]

  def show
    @member = current_member
  end

  def edit
    @member = current_member
  end

  def new
    @member = Member.new()
  end

  def update
    @member = current_member
    @member.assign_attributes(params[:account])
    if @member.save
      redirect_to :account, notice: "アカウント情報を更新しました。"
    else
      render "edit"
    end
  end

  def create
    @member = Member.new(params[:member])
    if @member.save
      session[:member_id] = @member.id
      redirect_to :root , notice: "会員を登録しました。"
    else
      render "new"
    end
  end

  def admin_show
    @admin
    if current_administrator
      @admin = current_administrator
    elsif current_brand
      @admin = current_brand
    end
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
    @admin.assign_attributes(params[:account])
    if @admin.save
      redirect_to :admin_show_account , notice: "アカウント情報を更新しました。"
    else
      render "admin_edit"
    end
  end
end
