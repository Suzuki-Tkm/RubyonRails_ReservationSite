class CreateAdministrators < ActiveRecord::Migration[5.2]
  def change
    create_table :administrators do |t|
      t.references :brand , null: false                     # 外部キーブランド
      t.string :name, null: false                           # ユーザー名
      t.string :email , null: false                         # メールアドレス
      t.string :password_digest  , null: false              # パス

      t.timestamps
    end
  end
end
