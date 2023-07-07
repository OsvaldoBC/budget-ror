require 'rails_helper'

RSpec.describe 'Groups#index page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Test User', email: 'test@test.com', password: '123456')
    @group = Group.create(name: 'Test Group', icon: 'group-icon.png', user: @user)

    login_as(@user)
    visit groups_path
  end

  it 'displays group name' do
    expect(page).to have_text(@group.name)
  end

  it 'displays group icon' do
    expect(page).to have_css("img[src*='group-icon.png']")
  end

  it 'displays total amount' do
    expect(page).to have_text('Payments total:')
  end
end
