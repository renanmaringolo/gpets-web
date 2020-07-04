require 'rails_helper'

feature 'register user' do
  scenario 'succesfully' do
    visit root_path
    click_on 'Sign up'
    fill_in 'Email', with: 'renan@gmail.com'
    fill_in 'Password', with: '12345678'
    fill_in 'Password confirmation', with: '12345678'
    click_on 'Sign up'

    expect(page).to_not have_link('Sign up')
  end

  scenario 'sign in' do
    user = User.create(email: 'renan@renan.com', encrypted_password: '1234567890')

    visit root_path
    click_on 'Sign in'
    fill_in 'Email', with: 'renan@gmail.com'
    fill_in 'Password', with: '12345678'
    click_on 'Log in'

    expect(page).to_not have_link('Sign in')
  end

  scenario 'sign out' do
    user = create(:user)

    login_as user
    visit root_path
    click_on 'Sign out'

    expect(page).to have_link('Sign in')
  end
end