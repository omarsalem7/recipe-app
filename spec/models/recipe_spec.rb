require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before(:each) do
    @user = User.create(name: 'Omar', email: 'omara@gmail.com', password: '123455')
    expect(@user).to be_valid
    @recipe = Recipe.create(name: 'hello', preparation_time: '4:00', cooking_time: '2:00', description: 'chocolat',
                            public: true, user: @user)
  end

  it 'should create a recipe' do
    expect(@recipe).to be_valid
    expect(@recipe.name).to eq 'hello'
    expect(@recipe.preparation_time).to eq '4:00'
    expect(@recipe.cooking_time).to eq '2:00'
    expect(@recipe.description).to eq 'chocolat'
    expect(@recipe.public).to eq true
    expect(@recipe.user).to eq @user
  end
end
