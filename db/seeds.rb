# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
def title
  5.times.map { lorem.sample }.join(" ").capitalize
end

def lorem
  "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.".gsub(/[.,]/, "").downcase.split(" ")
end

def author
  Author.all.sample
end

def published
  [true, true, false].sample
end

def published_at
  Time.now - [0, 1, 2, 3, 4, 5].sample.days
end

["Lorem Ipsum", "Magna Aliqua", "Commodo Consequat"].each do |name|
  Author.create name: name
end

35.times do |i|
  Article.create! title: title, author: author, published: published, published_at: published_at
end
