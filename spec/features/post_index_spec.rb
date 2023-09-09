require 'rails_helper'

RSpec.feature 'Post Index', type: :feature do
  let(:user) { User.create(name: 'Tom', photo: 'https://www.kasandbox.org/programming-images/avatars/leaf-blue.png', bio: 'He is a good programmer') }
  let!(:post) { Post.create(author: user, title: "first post's title", text: 'first text') }
  let!(:comment1) { Comment.create(author: user, post: post, text: 'first comment') }
  let!(:comment2) { Comment.create(author: user, post: post, text: 'second comment') }
  let!(:comment3) { Comment.create(author: user, post: post, text: 'third comment') }
  let!(:like1) { Like.create(author: user, post: post) }

  scenario "see user's profile picture, username, number of posts, and interactions" do
    visit user_posts_path(user)
    expect(page).to have_content('Tom')
    expect(page).to have_css("img[src='https://www.kasandbox.org/programming-images/avatars/leaf-blue.png']", count: 1)
    expect(page).to have_content('1 post')
    expect(page).to have_content('Comments: 3')
    expect(page).to have_content('Likes: 1')
  end

  scenario "see some of the post's title, body, and first comments" do
    visit user_posts_path(user)
    expect(page).to have_content("first post's title")
    expect(page).to have_content('first text')
    expect(page).to have_content('first comment')
  end

  scenario 'see a section for pagination if there are more posts than fit on the view' do
    # Assuming you have a way to generate more posts for pagination testing
    # If not, you may need to create additional posts to trigger pagination
    visit user_posts_path(user)
    # You can add your expectations for pagination here
    # For example, you can look for HTML elements that indicate pagination controls
    expect(page).to have_css('.pagination')
  end

  scenario "clicking on a post redirects me to that post's show page" do
    visit user_posts_path(user)
    click_link "first post's title"
    expect(page).to have_current_path(post_path(post))
  end
end
