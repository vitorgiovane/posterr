# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

donec = User.create(username: 'donec')
semper = User.create(username: 'semper')
vitae = User.create(username: 'vitae')

post_one = Post.create(user: donec, content: 'Fusce quis ante tempus, lobortis magna in, pretium turpis.')
post_two = Post.create(user: semper, content: 'Suspendisse in mi sit amet nibh efficitur suscipit nec eget felis.')
post_three = Post.create(user: vitae, content: 'Cras nec tincidunt velit. Pellentesque interdum lacus urna.')

post_four = Post.create(user: semper, parent: post_one)
post_five = Post.create(user: semper, parent: post_three, content: 'Mauris ac tempus tellus.')

post_six = Post.create(user: vitae, parent: post_five, content: 'Maecenas sit amet blandit nunc, id fermentum turpis.')
Post.create(user: vitae, parent: post_five)

Post.create(user: donec, parent: post_six)
