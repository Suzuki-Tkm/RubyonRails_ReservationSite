names = %w(スウェット MA-1 スラックス つなぎ スカート ドレス ネクタイ  トートバッグ スニーカー 指輪  パーカー ブルゾン チノパンツ サロペット デニムスカート 着物 ケース ポーチ サンダル ネックレス)
0.upto(names.length - 1) do |idx|
  product = Product.create(
    category_id: (idx % Category.all.length) + 1,
    brand_id: (idx % Brand.all.length) + 1,
    name: names[idx],
    price: rand(1..10000),
    stock: rand(1..100)
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
