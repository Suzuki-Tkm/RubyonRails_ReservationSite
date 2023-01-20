class BrandsController < ApplicationController
  before_action :administrator_login_required , except: [:show]

  def index
    @brands = Brand.all
  end

  def show
    @brand = Brand.find(params[:id])
    @products = Brand.find(params[:id]).products
  end

  def new
    @administrator = Administrator.new()
  end

  def create
    @brands = Brand.all
    @administrator = Administrator.new(params[:administrator])
    if @administrator.save
      redirect_to :brands , notice: "ブランドを登録しました。"
    else
      render "new"
    end
  end

  def destroy
    @brand = Brand.find(params[:id])
    products_id = []
    @brand.products.each do |p|
      products_id.push(p.id)
    end

    if Order.exists?(product_id: products_id)
      redirect_to :brands, notice: "注文された商品があるため消去できません"
    else
      @brand.administrator.destroy
      @brand.destroy
      redirect_to :brands, notice: "削除しました。"
    end
  end
end
