Category.destroy_all
Post.destroy_all

10.times {Category.create!(title: Faker::Lorem.sentence)}

categories = Category.all

70.times do
  Post.create!(title: Faker::Lorem.sentence,
             body: Faker::Lorem.paragraph,
             location: Faker::Address.city,
             price: rand(100),
             category: categories.sample)
end
