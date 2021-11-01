require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  describe "GET #index" do
    let(:comment) { FactoryBot.create(:comment) }
    subject { get :index, params: { post_id: comment.post.id } }

    it { is_expected.to have_http_status(:success) }
    it { expect(JSON.parse(subject.body).sample).to include "id", "post", "user", "likes", "content" }
  end

  describe "GET #create" do
    let!(:post_commentable) { FactoryBot.create(:post) }
    subject { post :create, params: { post_id: post_commentable.id, comment: { content: Faker::Lorem.characters(number: 10) } } }

    it { is_expected.to have_http_status(:success) }
    it { expect { subject }.to change { post_commentable.comments.count } }
    it { expect(JSON.parse(subject.body)).to include "id", "post", "user", "likes", "content" }
  end

end
