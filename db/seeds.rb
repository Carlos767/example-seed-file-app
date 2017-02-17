User.destroy_all
Article.destroy_all
Vote.destroy_all

names = ["Luke", "Carlos", "Andrew", "George"]

names.each do |name|
  user = User.new(name: name, email: "#{name}@gmail.com", password: "password")
    user.save

    3.times do article = Article.new(
      title: Faker::Hipster.sentence,
      body: Faker::Hipster.paragraph(3),
      url: Faker::Internet.url,
      user_id: user.id
      )
    article.save
  end
end

users = User.all
articles = Article.all

articles.each do |article|
  users.each do |user|
    vote = Vote.new(
      user_id: user.id,
      article_id: article.id,
      vote_value: [-1, 0, 1].sample
      )
    vote.save
  end
end

puts "Yay!"