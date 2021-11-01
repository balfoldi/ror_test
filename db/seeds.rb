[Comment, Post, User].each do |model|
  model.delete_all
end

FactoryBot.create_list(:user, 10)

FactoryBot.create_list(:post, 10)

FactoryBot.create_list(:comment, 10)
