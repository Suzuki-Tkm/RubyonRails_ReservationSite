class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :category , null: false                  # 外部キーカテゴリー
      t.references :brand , null: false                     # 外部キーブランド
      t.string :name, null: false                           # 商品名
      t.integer :stock , null: false                        # 在庫
      t.integer :price , null: false                        # 価格
      t.timestamps
    end
  end
end
