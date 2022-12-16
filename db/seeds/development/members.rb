names = %w(Taro Jiro Hana John Mike Sophy Bill Alex Mary Tom)
0.upto(9) do |idx|
  Member.create(
    name: names[idx],
    email: "#{names[idx]}@example.com",
    phone_number: "1981-12-01",
    address: "神田",
    password: "zozo!",
    password_confirmation: "zozo!"
  )
end
