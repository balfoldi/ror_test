require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  describe "GET #index" do
    let!(:user_logged) { FactoryBot.create(:user) }
    let(:post) { FactoryBot.create(:post) }
    let(:comment) { FactoryBot.create(:comment, post: post, user: user_logged) }
    let!(:comment_liked) { FactoryBot.create(:comment, post: post, user: user_logged) }
    let!(:like) { FactoryBot.create(:like, user: user_logged, liked: comment_liked) }

    subject { get :index, params: { post_id: comment.post.id } }

    it { is_expected.to have_http_status(:success) }
    it { expect(JSON.parse(subject.body).sample).to include "id", "post", "user", "likes_count", "content", "liked" }

    it "liked key return true if user_logged like" do
      comment_liked_attributes = JSON.parse(subject.body).find { |comment_attributes| comment_attributes["id"] == comment_liked.id }
      expect(comment_liked_attributes["liked"]).to be true
    end

    it "liked key return false if user_logged did not like" do
      comment_attributes = JSON.parse(subject.body).find { |comment_attributes| comment_attributes["id"] == comment.id }
      expect(comment_attributes["liked"]).to be false
    end

    it "like_count attributes return an integer" do
      comment_attributes = JSON.parse(subject.body).sample
      expect(comment_attributes["likes_count"]).to be_a_kind_of(Integer)
    end
  end

  describe "GET #create" do
    let(:post_commentable) { FactoryBot.create(:post) }

    context "valid data" do
      subject { post :create, params: { post_id: post_commentable.id, comment: { content: Faker::Lorem.characters(number: 10) } } }

      it { is_expected.to have_http_status(:success) }
      it { expect { subject }.to change { post_commentable.comments.count } }
      it { expect(JSON.parse(subject.body)).to include "id", "post", "user", "likes_count", "content", "liked" }
    end

    context "invalid data" do
      subject { post :create, params: { post_id: post_commentable.id, comment: { content: Faker::Lorem.characters(number: Comment::MINIMUM_CONTENT_LENGTH - 1) } } }

      it { is_expected.to have_http_status(:bad_request) }
      it { expect { subject }.to_not change { post_commentable.comments.count } }
      it { expect(JSON.parse(subject.body)).to include "errors" }
    end
  end

end
