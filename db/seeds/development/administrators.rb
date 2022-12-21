names = %w(hikari miyu kotoya takumi haruto)
0.upto(4) do |idx|
  Administrator.create(
    brand_name: nil,
    name: names[idx],
    email: "#{names[idx]}@example.com",
    password: "zozo!",
    password_confirmation: "zozo!"
  )
end
names_b = %w(CHANEL GUCCI DIOR PRADA FENDI COACH UNIQLO Manhattan THENORTHFACE VUITTON)
0.upto(9) do |idx|
  Administrator.create(
    brand_name: names_b[idx],
    brand_id: idx + 1,
    name: names_b[idx],
    email: "#{names_b[idx]}@example.com",
    password: "zozo!",
    password_confirmation: "zozo!"
  )
end