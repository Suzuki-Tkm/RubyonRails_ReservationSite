class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :product, null: false                 # 外部キー
      t.references :member, null: false                  # 外部キー
      t.integer :orders , default: 1 , null: false       # 注文個数
      t.string :status , default: "cart" , null: false   # 状態
      t.datetime :order_date                             # 注文日時
      t.timestamps
    end
  end
end
