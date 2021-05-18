# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Authorization', type: :feature do
  scenario 'When click in SignIn' do
    visit(root_path)
    expect(page).to have_link('Sign In')
  end
  scenario 'When clicked in SignIn' do
    visit(root_path)
    click_on('Sign In')
    expect(page).to have_content('Sign In')
  end
  scenario 'When fields are empties' do
    visit(sign_in_path)
    click_on('Sign In')
    expect(page).to have_content('Warning')
  end
  scenario 'When blocked user account' do
    visit(new_user_path)
    username = Faker::Name.name
    email = Faker::Internet.email
    fill_in('user_username', with: username)
    fill_in('user_email', with: email)
    fill_in('user_password', with: '123123')
    fill_in('user_password_confirmation', with: '123123')
    click_on('Sign Up')

    visit(sign_in_path)
    fill_in('user_email', with: username)
    fill_in('user_password', with: '123321')
    click_on('Sign In')
    fill_in('user_email', with: username)
    fill_in('user_password', with: '123321')
    click_on('Sign In')
    fill_in('user_email', with: username)
    fill_in('user_password', with: '123321')
    click_on('Sign In')
    expect(page).to have_content('Warning')
  end
end
