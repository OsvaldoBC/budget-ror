require 'rails_helper'

RSpec.describe Group, type: :model do
  subject do
    @user = User.create(name: 'Test User', email: 'test@test.com', password: '123456')
    @group = Group.create(name: 'Test Group', icon: 'group-icon', user: @user)
  end

  before { subject.save }

  describe 'Validations' do
    it 'is not valid without name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'name should not be too long' do
      subject.name = 'a' * 300
      expect(subject).to_not be_valid
    end

    it 'is not valid without icon' do
      subject.icon = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a user' do
      subject.user = nil
      expect(subject).to_not be_valid
    end
  end
end
