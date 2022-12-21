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
      redirect_to :products, notice: "商品を更新しました。"
    else
      render "edit"
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to :products, notice: "商品を削除しました。"
  end

  def like
    @product = Product.find(params[:id])
    current_member.voted_products << @product
    redirect_to @product, notice: "投票しました。"
  end
  
  def unlike
    current_member.voted_products.destroy(Product.find(params[:id]))
    redirect_to :voted_products, notice: "削除しました。"
  end
  
  def unlike1
    current_member.voted_products.destroy(Product.find(params[:id]))
    redirect_to Product.find(params[:id]) , notice: "削除しました。"
  end
  
  def voted
    @products = current_member.voted_products
  end
end