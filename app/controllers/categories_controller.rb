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
      @categories = Category.all
      @category = Category.new()
      redirect_to :categories , notice: "同じ名前のカテゴリーがあります。"
    end
  end
end
