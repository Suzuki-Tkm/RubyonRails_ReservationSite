names = %w(スウェット MA-1 スラックス つなぎ スカート ドレス ネクタイ  トートバッグ スニーカー 指輪)
names_c = %w(トップス ジャケット パンツ オールインワン スカート ワンピース 小物 バッグ シューズ アクセサリー)
names_b = %w(CHANEL GUCCI DIOR PRADA FENDI COACH ユニクロ マンハッタン ノースフェーす シェいん)
0.upto(9) do |idx|
  product = Product.create(
    category_id: idx,
    brand_id: idx,
    name: names[idx],
    price: idx * 100,
    stock: idx
  )
  if idx == 7 || idx == 8
    %w(John Mike Sophy).each do |name|
      voter = Member.find_by(name: name)
      voter.voted_products << product
    end
    %w(Taro Bill Sophy).each do |name|
      orderer = Member.find_by(name: name)
      orderer.ordered_products << product 
    end
  end
end
