class CategoriesController < ApplicationController
  before_action :administrator_login_required , except: [:show]

  def index
    @categories = Category.all
    @category = Category.new()
  end

  def show
    @products = Category.find(params[:id]).products
  end

  def create
    @category = Category.new(params[:category])
    if @category.save
      redirect_to :categories , notice: "カテゴリーを登録しました。"
    else
      render "index"
    end
  end
end
