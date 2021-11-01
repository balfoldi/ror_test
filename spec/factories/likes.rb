FactoryBot.define do
  factory :like do
    user
    liked { [Post, Comment].sample.all.sample }
  end
end
