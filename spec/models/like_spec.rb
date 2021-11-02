require 'rails_helper'

RSpec.describe Like, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:liked) }

  describe "callbacks" do
    describe "#update_comment_likes_count" do
      context "create like" do
        let(:comment) { FactoryBot.create(:comment) }

        it { expect { FactoryBot.create(:like, liked: comment) }.to change { comment.likes_count } }
      end

      context "destroy like" do
        let(:comment) { FactoryBot.create(:comment) }
        let!(:like) { FactoryBot.create(:like, liked: comment) }

        it { expect { like.destroy }.to change { comment.likes_count } }
      end
    end
  end
end
