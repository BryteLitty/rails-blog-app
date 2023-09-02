require 'rails_helper'

RSpec.describe 'post index page' do
  fake_user = User.create(name: 'Kena', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  first_post = Post.create(author: fake_user, title: 'Hello', text: 'This is my first post')
  second_post = Post.create(author: fake_user, title: 'Hello', text: 'This is my first post')
  Post.create(author: fake_user, title: 'Hello', text: 'This is my first post')
  Comment.create('text' => 'Bonjour les freres', 'author' => fake_user, 'post' => first_post)
  Comment.create('text' => 'Bonjour les freres', 'author' => fake_user, 'post' => second_post)

  it 'shows the username of all other users' do
    visit '/users'

    users = page.all('.username')
    users.each do |user|
      expect(user).to have_content(user.text)
    end
  end

  it 'shows the profile picture for each user' do
    visit '/users'

    users = page.all('.profile-picture')
    users.each do |profile_picture|
      expect(profile_picture).to have_css('img')
    end
  end

  it 'shows the number of posts each user has written' do
    visit '/users'

    users = page.all('.number-of-posts')
    users.each do |number_of_posts|
      expect(number_of_posts).to have_content(number_of_posts.text)
    end
  end

  it 'redirects to the user show page when a user is clicked' do
    visit '/users'

    if (user = page.all('.username').first)
      user.click
      expect(page.current_path).to eq(user_path(user.text))
    else
      puts 'There is no user to click on.'
    end
  end
end
