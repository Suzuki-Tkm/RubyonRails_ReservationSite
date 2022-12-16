class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :name, null: false                           # ユーザー名
      t.string :email , null: false                         # メールアドレス
      t.string :phone_number , null: false                  # 電話番号
      t.string :address, null: false                        # 住所
      t.string :password_digest , null: false               # パス
      t.timestamps
    end
  end
end
