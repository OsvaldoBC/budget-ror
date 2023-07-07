require 'rails_helper'

RSpec.describe 'Payments#new page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Test User', email: 'test@test.com', password: '123456')
    @group = Group.create(name: 'Test Group', icon: 'group-icon.png', user: @user)

    login_as(@user)
    visit new_group_payment_path(@group)
  end

  it 'displays the form fields' do
    expect(page).to have_field('Name')
    expect(page).to have_field('Amount ($)')
  end

  it 'displays the correct button' do
    expect(page).to have_button('Create Payment')
  end

  it 'display categories to choose' do
    expect(page).to have_text('Choose categories (at least one):')
  end
end
