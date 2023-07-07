require 'rails_helper'

RSpec.describe 'Payments#index page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Test User', email: 'test@test.com', password: '123456')
    @group = Group.create(name: 'Test Group', icon: 'group-icon.png', user: @user)
    @payment = Payment.create(name: 'Test Payment, amount: 100, author: @user')

    login_as(@user)
    visit group_payments_path(@group)
  end

  it 'displays total amount' do
    expect(page).to have_text('Payments total:')
  end

  it 'displays payment date' do
    expect(page).to have_text(@payment.created_at)
  end

  it 'displays payment amount' do
    expect(page).to have_text(@payment.amount)
  end
end
