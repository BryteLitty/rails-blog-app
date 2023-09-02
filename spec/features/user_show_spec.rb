require 'rails_helper'

RSpec.describe 'User show page' do
  fake_user = User.create(name: 'Kena', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  first_post = Post.create(author: fake_user, title: 'Hello', text: 'This is my first post')
  second_post = Post.create(author: fake_user, title: 'Hello', text: 'This is my first post')
  Post.create(author: fake_user, title: 'Hello', text: 'This is my first post')
  Comment.create('text' => 'Bonjour les freres', 'author' => fake_user, 'post' => first_post)
  Comment.create('text' => 'Bonjour les freres', 'author' => fake_user, 'post' => second_post)

  it 'has a profile picture' do
    visit "/users/#{fake_user.id}"

    users = page.all('.profile-picture')
    users.each do |profile_picture|
      expect(profile_picture).to have_css('img')
    end
  end

  it 'shows the user\'s username' do
    visit "/users/#{fake_user.id}/posts"
    expect(page).to have_content(fake_user.name)
  end

  it 'has a bio section' do
    visit "/users/#{fake_user.id}"

    expect(page).to have_css('div.bio')
    expect(page).to have_content('Bio')
    expect(page).to have_css('h3')
  end

  it 'shows the number of posts each user has written' do
    visit "/users/#{fake_user.id}"

    users = page.all('.number-of-posts')
    users.each do |number_of_posts|
      expect(number_of_posts).to have_content(number_of_posts.text)
    end
  end

  it 'shows the number of posts' do
    visit "/users/#{fake_user.id}"

    users = page.find_all('.post')
    expect(users.length).to eq(3)
  end

  it 'shows the button that lets me view all of a user posts.' do
    visit "/users/#{fake_user.id}"

    users = page.find('.btn')
    expect(users).to have_content('See all posts')
  end

  it 'redirects to the user show page when a user is clicked' do
    visit "/users/#{fake_user.id}"

    if (user = page.all('.username').first)
      user.click
      expect(page.current_path).to eq(user_path(user.text))
    else
      puts 'There is no user to click on.'
    end
  end

  it 'redirects to the user\'s post index page when I click to see all posts' do
    visit "/users/#{fake_user.id}"

    click_link('See all posts')

    expect(page).to have_current_path("/users/#{fake_user.id}/posts")
  end
end
