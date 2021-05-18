# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AuthenticationsController, type: :controller do
  let!(:user) { FactoryBot.create(:user) }
  describe 'POST /create' do
    it 'when user logged' do
      post :create, params: { user: { email: user.email, password: user.password } }
    end
    it 'when user failed attempts incremented' do
      post :create, params: { user: { email: user.email, password: '321321' } }
      user.reload
      expect(user.failed_attempts).to eq(1)
    end
    it 'when user are blocked' do
      post :create, params: { user: { email: user.email, password: '321321' } }
      post :create, params: { user: { email: user.email, password: '321321' } }
      post :create, params: { user: { email: user.email, password: '321321' } }
      user.reload
      expect(user.failed_attempts).to eq(3)
    end
    it 'when user are desblocked' do
      post :create, params: { user: { email: user.email, password: '321321' } }
      post :create, params: { user: { email: user.email, password: '321321' } }
      post :create, params: { user: { email: user.email, password: '321321' } }
      post :create, params: { user: { email: user.email, password: user.password } }
      user.reload
      expect(user.failed_attempts).to eq(0)
    end
    it 'when session are created' do
      post :create, params: { user: { email: user.email, password: user.password } }
      user.reload
      expect(session[:user_id]).not_to eq(nil)
    end
  end
  describe 'POST /destroy' do
    it 'when are destroyed' do
      post :create, params: { user: { email: user.email, password: user.email } }
      user.reload
      post :destroy
      expect(session[:user_id]).to eq(nil)
    end
  end
end
