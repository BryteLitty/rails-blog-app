require 'rails_helper'

RSpec.describe 'post show page' do
  fake_user = User.create(name: 'Kena', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  first_post = Post.create(author: fake_user, title: 'Hello', text: 'This is my first post')
  second_post = Post.create(author: fake_user, title: 'Hello', text: 'This is my first post')
  Post.create(author: fake_user, title: 'Hello', text: 'This is my first post')
  first_comment = Comment.create('text' => 'Bonjour les freres', 'author' => fake_user, 'post' => first_post)
  Comment.create('text' => 'Bonjour les freres', 'author' => fake_user, 'post' => second_post)

  it 'shows the user\'s profile picture' do
    visit "/users/#{fake_user.id}/posts"
    users = page.all('.profile-piture')
    users.each do |profile_picture|
      expect(profile_picture).to have_css('img')
    end
  end

  it 'shows the user\'s username' do
    visit "/users/#{fake_user.id}/posts"

    expect(page).to have_content(fake_user.name)
  end

  it 'shows the number of posts the user has written' do
    visit "/users/#{fake_user.id}/posts"

    expect(page).to have_content('Number of posts: 3')
  end

  it 'shows a posts title' do
    visit "/users/#{fake_user.id}/posts"

    post = page.all('.post').first
    expect(post).to have_content(first_post.title)
  end

  it 'shows some of the post\'s body' do
    visit "/users/#{fake_user.id}/posts"

    post = page.all('.post').first
    expect(post).to have_content(first_post.text)
  end

  it 'shows the first comments on a post' do
    visit "/users/#{fake_user.id}/posts"
    expect(page).to have_content(first_comment.text)
  end

  it 'shows how many comments a post has' do
    visit "/users/#{fake_user.id}/posts"
    expect(page).to have_content(second_post.comments_counter)
  end

  it 'shows how many likes a post has' do
    visit "/users/#{fake_user.id}/posts"
    expect(page).to have_content(first_post.likes_counter)
  end

  it 'shows a section for pagination if there are more posts than fit on the view' do
    visit "/users/#{fake_user.id}/posts"

    posts = page.all('.post')
    if posts.length > 3
      expect(page).to have_css('ul.pagination')
    else
      expect(page).not_to have_css('ul.pagination')
    end
  end

  it 'redirects me to the post show page when I click on a post' do
    visit "/users/#{fake_user.id}/posts"

    post = page.all('.pst').first
    post.click

    expect(page).to have_current_path("/users/#{fake_user.id}/posts")
  end
end
