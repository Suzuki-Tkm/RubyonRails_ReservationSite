names = %w(CHANEL GUCCI DIOR PRADA FENDI COACH UNIQLO Manhattan THENORTHFACE VUITTON)
0.upto(9) do |idx|
  Brand.create(
    name: names[idx]
  )
end