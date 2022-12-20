class CategoriesController < ApplicationController
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
