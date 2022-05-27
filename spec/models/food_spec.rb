require 'rails_helper'

RSpec.describe Food, type: :model do
  subject do
    @user = User.create!(name: 'Mphatso', email: 'mphatso@mail.com', password: 'password')
    food = Food.create!(name: 'Casava', measurement_unit: 'unit', price: 2, user_id: @user.id)
  end

  before(:each) { subject.save }

  it 'Name is not nil' do    
    subject.name = nil
    expect(subject).to_not be_valid
  end
end
