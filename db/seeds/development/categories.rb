names = %w(トップス ジャケット パンツ オールインワン スカート ワンピース 小物 バッグ シューズ アクセサリー)
0.upto(9) do |idx|
  Category.create(
    name: names[idx]
  )
end