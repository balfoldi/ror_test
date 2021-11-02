require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:post) }

  describe "#update_likes_count" do
    subject { FactoryBot.create(:comment) }

    context "after creation" do
      it { expect(subject.likes_count).to be 0}
    end

    context "has multiples likes" do
      let!(:likes) { FactoryBot.create_list(:like, rand(2..10), liked: subject) }

      before { subject.update(likes_count: 0)}
      it { expect { subject.update_likes_count }.to change { subject.likes_count }.by(likes.size) }
    end
  end
end
