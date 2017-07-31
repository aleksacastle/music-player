# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 20.times { |x| Genre.create!(title: "genre-#{x + 1}") }

AdminUser.create!(email: "admin@example.com", password: "password", password_confirmation: "password")

# 7.times { |x| Playlist.create!(title: "Playlist - #{x + 1}", user_id: 1, picture: picture.first) }
