# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Welcome', type: :feature do
  scenario 'When Im in a root page' do
    visit(root_path)
    expect(page).to have_content('Pocket Health System')
  end
  scenario 'When click in SignIn' do
    visit(root_path)
    expect(page).to have_link('Sign In')
  end
  scenario 'When click in SignUp' do
    visit(root_path)
    expect(page).to have_link('Sign Up')
  end
end
