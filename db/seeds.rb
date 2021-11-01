[User, Post].each do |model|
  model.destroy_all
end

FactoryBot.create_list(:user, 10)

FactoryBot.create_list(:post, 10) do |post|
  post.user = User.all.sample
end
