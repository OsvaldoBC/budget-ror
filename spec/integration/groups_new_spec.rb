require 'rails_helper'

RSpec.describe 'Groups#new page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Test User', email: 'test@test.com', password: '123456')

    login_as(@user)
    visit new_group_path
  end

  it 'displays the form fields' do
    expect(page).to have_field('Name')
    expect(page).to have_field('Icon (URL)')
  end

  it 'displays the correct button' do
    expect(page).to have_button('Create Category')
  end
end
