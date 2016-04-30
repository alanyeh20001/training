# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.create!(email: "user1@example.org", password: "11111111", password_confirmation: "11111111", name: "TEST")

group = user.groups.create!(title: "group no.1", description: "this is group no.1 by seed")
group_user = GroupUser.create!(group_id: group.id, user_id: user.id)
post = group.posts.create!(content: "this is post no.1 by seed", user_id: user.id)
