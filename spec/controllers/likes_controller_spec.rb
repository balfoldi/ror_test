require 'rails_helper'

RSpec.describe LikesController, type: :controller do


  describe "Post #create comment" do
    let(:comment) { FactoryBot.create(:comment) }
    subject { post :create, params: { liked_id: comment.id, liked_type: comment.class.name } }

    it { is_expected.to have_http_status(:success) }
    it { expect { subject }.to change { comment.likes.count } }
    it { expect(JSON.parse(subject.body)).to include "id", "liked", "liked_type", "user" }
  end

  describe "Post #create post_likable" do
    let(:post_likable) { FactoryBot.create(:post) }
    subject { post :create, params: { liked_id: post_likable.id, liked_type: post_likable.class.name } }

    it { is_expected.to have_http_status(:success) }
    it { expect { subject }.to change { post_likable.likes.count } }
    it { expect(JSON.parse(subject.body)).to include "id", "liked", "liked_type", "user" }
  end

end
