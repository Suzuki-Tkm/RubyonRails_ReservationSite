class MembersController < ApplicationController
  before_action :administrator_login_required
  
  def index
    @members = Member.all.order(:name)
  end
  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    redirect_to :members, notice: "会員を削除しました。"
  end
end
