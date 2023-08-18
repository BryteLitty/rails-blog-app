require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(title: 'Great Spears in Danger', comments_counter: 2, likes_counter: 3) }

  before { subject.save }

  it 'title must not be blank' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title must not exceed 250 characters' do
    subject.title = 'a' * 251
    expect(subject).to_not be_valid
  end

  it 'comments_counter must be an integer greater than or equal to 0' do
    subject.title = -2
    expect(subject).to_not be_valid
  end

  it 'likess_counter must be an integer greater than or equal to 0' do
    subject.title = -5
    expect(subject).to_not be_valid
  end

  # for testing methods
  describe '#post_counts' do
    it 'returns the most recent 2 posts' do
      post = Post.new(comments: [Comment.new, Comment.new])
      post.save
      expect(post.recent_comments).to eq(post.comments.order(created_at: :desc).limit(2))
    end
  end
end
