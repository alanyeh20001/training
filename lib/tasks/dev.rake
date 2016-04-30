require "populator"

namespace :dev do 
  desc "Rebuild system"
  task build: ["tmp:clear", "log:clear", "db:drop", "db:create", "db:migrate"]
  task rebuild: ["dev:build", "db:seed"]

  desc "Make fake data"
  task fake: :environment do
    user = User.find_or_create_by!(email: "user2@example.org") do |user|
      user.email = "user2@example.org"
      user.password = "11111111" 
      user.password_confirmation = "11111111"
      user.name = "RAKE"
    end
    Group.populate(10) do |group|
      group.title = Populator.words(1..10)
      group.description = Populator.sentences(1)
      group.user_id = user.id
      GroupUser.create!(group_id: group.id, user_id: user.id)
      Post.populate(5) do |post|
        post.content = Populator.paragraphs(1)
        post.group_id = group.id
        post.user_id = user.id
      end
    end
  end
end
