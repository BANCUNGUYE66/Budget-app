require 'rails_helper'

RSpec.describe Group, type: :model do
  it 'is valid with a name' do
    group = Group.new(name: 'Example Group')
    expect(group).to be_valid
  end

  it 'is not valid without a name' do
    group = Group.new
    expect(group).not_to be_valid
  end
end
