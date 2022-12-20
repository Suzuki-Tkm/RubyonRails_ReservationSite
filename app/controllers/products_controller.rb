class ProductsController < ApplicationController
  def index
    @products = Product.all #おすすめ商品の予定
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new()
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(params[:product])
    if @product.save
      redirect_to :products, notice: "商品を登録しました。"
    else
      render "new"
    end
  end

  def update
    @product = Product.find(params[:id])
    @product.assign_attributes(params[:product])
    if @product.save
      redirect_to :products, notice: "会員情報を更新しました。"
    else
      render "edit"
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to :products, notice: "会員を削除しました。"
  end
end
