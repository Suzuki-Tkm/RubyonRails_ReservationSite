class AccountsController < ApplicationController
  before_action :member_login_required , except: [:new, :create]

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
      cookies.signed[:member_id] = @member.id
      redirect_to :root , notice: "会員を登録しました。"
    else
      render "new"
    end
  end

end
