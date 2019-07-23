# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Users
user = User.new(email: "oscar@example.com", username: "reciog.oscar", password: "password", password_confirmation: "password")
user.skip_confirmation!
user.save!
user = User.new(email: "juan@example.com", username: "juan.lopez", password: "password", password_confirmation: "password")
user.skip_confirmation!
user.save!
user = User.new(email: "layla@example.com", username: "layla.clapton", password: "password", password_confirmation: "password")
user.skip_confirmation!
user.save!
# Posts by user
Post.create(content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam auctor volutpat risus sit amet pulvinar.", user: User.find(1))
Post.create(content: "Nullam dignissim ante justo, sed finibus ipsum tempus non. Curabitur in viverra tellus, ac pulvinar neque. Cras viverra mattis magna,", user: User.find(2))
Post.create(content: "ac finibus tortor suscipit dapibus. In sit amet dui arcu. Sed auctor ante eu laoreet tincidunt. Ut erat quam, mollis nec fermentum sed", user: User.find(3))
Post.create(content: "Duis et eros justo. Vivamus velit metus, tempus vitae aliquet ut, egestas quis augue. Aliquam sit amet rutrum nisi", user: User.find(1))
Post.create(content: "Sed orci metus, viverra ut consequat sit amet, gravida pulvinar nulla. Sed ut elit id metus scelerisque mollis.", user: User.find(2))
Post.create(content: "Aenean dignissim augue a nunc lobortis interdum. Fusce iaculis nec purus eget placerat. Morbi dictum ullamcorper dui aliquet suscipit.", user: User.find(3))
