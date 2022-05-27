require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.create!(name: 'Mphatso', email: 'mphatso@mail.com', password: 'password')
  end

  before { subject.save }

  it 'should have name mphatso' do
    expect(subject.name).to eql('Mphatso')
  end

  it 'should have name present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should have email mphatso@mail.com' do
    expect(subject.email).to eql('mphatso@mail.com')
  end

  it 'email should be present' do
    subject.email = nil
    expect(subject).to_not be_valid
  end
end
