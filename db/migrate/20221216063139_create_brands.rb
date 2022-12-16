class CreateBrands < ActiveRecord::Migration[5.2]
  def change
    create_table :brands do |t|
      t.string :name, null: false #ブランド名
      t.timestamps
    end
  end
end
