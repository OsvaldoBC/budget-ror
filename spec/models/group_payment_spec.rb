require 'rails_helper'

RSpec.describe GroupPayment, type: :model do
  subject do
    @user = User.create(name: 'Test User', email: 'test@test.com', password: '123456')
    @payment = Payment.create(name: 'Test Payment', amount: 100, author: @user)
    @group = Group.create!(name: 'Test Group', icon: 'group-icon', user: @user)
    @group_payment = GroupPayment.create!(payment: @payment, group: @group)
  end

  before { subject.save }

  describe 'Validations' do
    it 'is not valid without a group' do
      subject.group = nil
      expect(subject).to_not be_valid
    end
    it 'is not valid without a payment' do
      subject.payment = nil
      expect(subject).to_not be_valid
    end
  end
end
