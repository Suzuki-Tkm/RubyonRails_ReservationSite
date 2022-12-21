class OrdersController < ApplicationController
  before_action :member_login_required , only: [:history]
  before_action :brand_login_required , except: [:history]

  #注文履歴
  def history
    @orders = current_member.orders.history
  end
  #注文の取り消し
  def destroy 
    order = Order.find(params[:id])
    product = Product.find(order.product_id)
    product.stock = product.stock + order.orders
    redirect_to :history_orders, notice: "エラーが発生しました。" if order.status.eql?("after_ordering")
    if order.destroy && product.save
      redirect_to :history_orders , notice: "削除しました。"
    else
      redirect_to :history_orders , notice: "エラーが発生しました。"
    end
  end

  #ブランドの商品で注文されたもの
  def brand_order
    @orders = []
    Order.all.each do |o|
      @orders.push(o) if current_brand.brand_id == Product.all.find(o.product_id).brand_id && !o.status.eql?("cart")
    end
  end

  #ブランドの発送状況の変更
  def brand_send
    order = Order.find(params[:id])
    order.status = "after_ordering"
    if order.save
      redirect_to :brand_order_orders , notice: "発送しました"
    elsif
      redirect_to :brand_order_orders , notice: "エラーが発生しました。"
    end
  end
end
