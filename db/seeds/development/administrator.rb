names = %w(hikari miyu kotoya takumi haruto)
0.upto(4) do |idx|
  Administrator.create(
    name: names[idx],
    email: "#{names[idx]}@example.com",
    password: "zozo!",
    password_confirmation: "zozo!"
  )
end