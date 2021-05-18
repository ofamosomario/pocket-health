# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'User', type: :feature do
  scenario 'When click in SignUp' do
    visit(root_path)
    expect(page).to have_link('Sign Up')
  end
  scenario 'When clicked in SignUp' do
    visit(root_path)
    click_on('Sign Up')
    expect(page).to have_content('Sign Up')
  end
  scenario 'When clicked in LogIn link' do
    visit(root_path)
    click_on('Sign In')
    expect(page).to have_content('Sign In')
  end
  scenario 'When created a new user' do
    visit(new_user_path)
    username = Faker::Name.name
    fill_in('user_username', with: username)
    fill_in('user_email', with: Faker::Internet.email)
    fill_in('user_password', with: '123123')
    fill_in('user_password_confirmation', with: '123123')
    click_on('Sign Up')

    expect(User.last.username).to eq(username)
  end
  scenario 'When fields are empties' do
    visit(new_user_path)
    click_on('Sign Up')
    expect(page).to have_content('Error:')
  end
end
