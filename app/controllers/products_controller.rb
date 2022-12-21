class ProductsController < ApplicationController
  def index
    @products = Product.all #おすすめ商品の予定
  end

  def show
    @product = Product.find(params[:id])
    @purchase_flag = true #カートに入れてあるかジャッジ
    if current_member
      current_member.orders.each do |o|
        @purchase_flag = false if o.status.eql?("cart") && o.product_id == @product.id
      end
    end
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

  def cart
    @orders = current_member.orders.cart
  end

  def in
    product = Product.find(params[:id])
    orders = current_member.orders
    if orders.exists?(status: "cart" , product_id: product.id)
      order = current_member.orders.cart.find_by(product_id: product.id)
      product.stock = product.stock - 1
      order.orders = order.orders + 1
      if product.save
        order.save 
        redirect_to :cart_products, notice: "カートに入れました。"
      else
        redirect_to :product, notice: "在庫がないため追加できません"
      end
    else
      current_member.ordered_products << product
      redirect_to :cart_products, notice: "カートに入れました。"
    end
  end

  def out
    product = Product.find(params[:id])
    order = current_member.orders.cart.find_by(product_id: product.id)
    product.stock = product.stock + order.orders
    if product.save && order.destroy
      redirect_to :cart_products , notice: "削除しました。"
    else
      redirect_to :cart_products, notice: "エラーが発生しました。"
    end 
  end

  def increase
    product = Product.find(params[:id])
    order = current_member.orders.cart.find_by(product_id: product.id)
    product.stock = product.stock - 1
    order.orders = order.orders + 1
    if product.save && order.save
      redirect_to :cart_products
    else
      redirect_to :cart_products, notice: "在庫がないため追加できません"
    end
  end

  def decrease
    product = Product.find(params[:id])
    order = current_member.orders.cart.find_by(product_id: product.id)
    product.stock = product.stock + 1
    order.orders = order.orders - 1
    if product.save && order.save
      redirect_to :cart_products
    else
      redirect_to :cart_products, notice: "エラーが発生しました"
    end
  end

  def confirm
    @member = current_member
    @orders = current_member.orders.cart
    redirect_to :cart_products , notice: "注文の品がカートに入っていません" if @orders.size == 0    
  end

  def order
    orders = current_member.orders.cart
    orders.each do |o|
      o.status = "before_ordering"
      o.order_date = Time.current
      redirect_to :cart_products , notice: "エラーが生じました。" if !o.save
    end
    redirect_to :root, notice: "注文が完了しました。"
  end
end