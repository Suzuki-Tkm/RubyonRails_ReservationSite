names = %w(CHANEL GUCCI DIOR PRADA FENDI COACH ユニクロ マンハッタン ノースフェーす シェいん)
0.upto(9) do |idx|
  Brand.create(
    name: names[idx]
  )
end