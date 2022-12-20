class BrandsController < ApplicationController
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

  def edit
    @brand = Brand.find(params[:id])
  end

  def update
    @brand = Brand.find(params[:id])
    @brand.assign_attributes(params[:brand])
    if @brand.save
      redirect_to brands_path, notice: "ブランドを更新しました。"
    else
      render "edit"
    end
  end

  def destroy
    @brand = Brand.find(params[:id])
    @brand.destroy
    redirect_to :brands, notice: "削除しました。"
  end
end
