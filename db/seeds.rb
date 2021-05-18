# frozen_string_literal: true

User.create!(
  [
    { username: 'test1', email: 'test1@gmail.com', password: '123123', password_confirmation: '123123' },
    { username: 'test2', email: 'test2@gmail.com', password: '123123', password_confirmation: '123123' },
    { username: 'test3', email: 'test3@gmail.com', password: '123123', password_confirmation: '123123' }
  ]
)
