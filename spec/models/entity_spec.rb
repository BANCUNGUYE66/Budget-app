require 'rails_helper'

RSpec.describe Entity, type: :model do
  it 'is valid with a name and a non-negative amount' do
    user = User.create(name: 'Example User')
    entity = Entity.new(name: 'Example Entity', amount: 100, author: user)
    expect(entity).to be_valid
  end

  it 'is not valid without a name' do
    user = User.create(name: 'Example User')
    entity = Entity.new(amount: 100, author: user)
    expect(entity).not_to be_valid
  end

  it 'is not valid with a negative amount' do
    user = User.create(name: 'Example User')
    entity = Entity.new(name: 'Example Entity', amount: -50, author: user)
    expect(entity).not_to be_valid
  end
end
