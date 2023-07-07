require 'rails_helper'

RSpec.describe Group, type: :model do
  subject do
    @user = User.create(name: 'Test User', email: 'test@test.com', password: '123456')
    @payment = Payment.create(name: 'Test Payment, amount: 100, author: @user')
  end

  before { subject.save }

  describe 'Validations' do
    it 'is not valid without name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
    it 'is not valid without amount' do
      subject.amount = nil
      expect(subject).to_not be_valid
    end
    it 'is not valid if amount is not a number' do
      subject.amount = 'abc'
      expect(subject).to_not be_valid
    end
    it 'is not valid if amount is not bigger than 0' do
      subject.amount = -100
      expect(subject).to_not be_valid
    end
  end
end
