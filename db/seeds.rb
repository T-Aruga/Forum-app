# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
    name: "John Snow",
    email: 'testuser@gmail.com',
    password: 'aaaaaa'
)


(1..50).each do |i|
    User.create(name: Faker::Name.name, email: "test#{i}@test.com", password: 'aaaaaa')
end

(1..20).each do |i|
    Board.create(name: Faker::Name.name, title: Faker::Lorem.word, body: Faker::Lorem.sentence, user_id: Faker::Number.between(from: 1, to: 20))
end

(1..100).each do |i|
    Comment.create(name: "名無し#{i}さん", content: Faker::Lorem.sentence, user_id: Faker::Number.between(from: 1, to: 50), board_id: Faker::Number.between(from: 1, to: 20))
end




Tag.create([
    { name: '政治・経済' },
    { name: '趣味' },
    { name: 'スポーツ' },
    { name: 'グルメ' },
    { name: '音楽' },
    { name: '芸能' },
    { name: 'ゲーム' },
    { name: '文芸' },
    { name: '恋愛' },
    { name: 'キャリア' }
  ])
  
  (1..50).each do |i|
      BoardTag.create(tag_id: Faker::Number.between(from: 1, to: 10), board_id: Faker::Number.between(from: 1, to: 20))
  end