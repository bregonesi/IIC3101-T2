# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

[User, News].each(&:delete_all)

## Users
users = [
			{name: "Benjamin", last_name: "Regonesi", email: "baregonesi@uc.cl", password: "123456", created_at: Faker::Time.between(12.months.ago, Date.yesterday)},
			{name: "Arturo", last_name: "Tagle", email: "ajtagle@uc.cl", password: "123456", created_at: Faker::Time.between(12.months.ago, Date.yesterday)},
			{name: "Felipe", last_name: "Rojos", email: "farojos@uc.cl", password: "123456", created_at: Faker::Time.between(12.months.ago, Date.yesterday)}
		]

10.times do |x|
  name 			= Faker::Name.first_name
  last_name	= Faker::Name.last_name
  email 		= Faker::Internet.email
  password 		= "123456"
  created_at 	= Faker::Time.between(12.months.ago, Date.yesterday)
  users.push(name: name, last_name: last_name, email: email, password: password, created_at: created_at)
end

User.create(users)

## News and comments
User.all.each do |user|
	rand(1..5).times do |i|
		headline = Faker::Lorem.sentence(3, true)
		subhead = Faker::Lorem.paragraph(1, true, 3)
		copy = ""
		rand(1..6).times do |x|
			copy << "\n\n" + Faker::Lorem.paragraph(3, true, 20)
		end
		#user_id = user.id
		created_at = Faker::Time.between(user.created_at, Date.yesterday)
		#news = News.create({headline: headline, subhead: subhead, copy: copy, user_id: user_id, created_at: created_at})
		news = News.create({headline: headline, subhead: subhead, copy: copy, created_at: created_at})

		rand(0..15).times do |j|
			author = Faker::Name.name
			comment = ""
			rand(1..3).times do |z|
				comment << "\n\n" + Faker::Lorem.paragraph(1, true, 5)
			end
			news_id = news.id
			created_at = Faker::Time.between(news.created_at, Date.yesterday)
			NewsComment.create({author: author, comment: comment, news_id: news_id, created_at: created_at})
		end
	end
end