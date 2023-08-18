# require 'rails_helper'

# RSpec.describe User, type: :model do
#   subject { User.new(name: 'Bright', posts_counter: 1) }

#   before { subject.save }

#   it 'name should be present' do
#     subject.name = nil
#     expect(subject).to_not be_valid
#   end

#   it 'post counter must be an integer greater than or equal to zero' do
#     subject.posts_counter = -1
#     expect(subject).to_not be_valid
#   end

#   # for testing methods
#   describe '#recent_posts' do
#     it 'returns the most recent 3 posts' do
#       user = User.new(name: 'Kuler Mills')
#       post1 = Post.new(title: 'Post 1', author: user)
#       post2 = Post.new(title: 'Post 2', author: user)
#       post3 = Post.new(title: 'Post 3', author: user)
#       expect(user.recent_posts.limit(3).to_a).to eq([])
#     end
#   end
# end

require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Bright', posts_counter: 1) }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'post counter must be an integer greater than or equal to zero' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  # for testing methods
  describe '#recent_posts' do
    it 'returns the most recent 3 posts' do
      user = User.new(name: 'Kuler Mills')
      Post.new(title: 'Post 1', author: user)
      Post.new(title: 'Post 2', author: user)
      Post.new(title: 'Post 3', author: user)
      expect(user.recent_posts.limit(3).to_a).to eq([])
    end
  end
end
