require 'rails_helper'

RSpec.describe 'Entities', type: :feature do
  before(:each) do
    @user = User.create(name: 'Test user', email: 'test444@gmail.com', password: '123456',
                        password_confirmation: '123456')

    sign_in @user, scope: :user

    file_path = Rails.root.join('app', 'assets', 'images', 'back.png')
    file = File.open(file_path)
    @group = Group.new(name: 'Test group', author_id: @user.id)
    @group.icon.attach(io: file, filename: 'back.png', content_type: 'image/png')
    @group.save

    @expense = Entity.create(name: 'Test expense', amount: 100, author_id: @user.id, group_id: @group.id)
  end

  describe 'Entity detail page' do
    scenario 'should have a entity detail page' do
      visit group_entities_path(@group)
      expect(page).to have_content(@group.name)
    end

    scenario 'should have a entity total' do
      visit group_entities_path(@group)
      expect(page).to have_content(Entity.where(group_id: @group.id).sum(:amount))
    end

    scenario 'should have add new entity link' do
      visit group_entities_path(@group)
      expect(page).to have_content('Add new transaction')
    end

    scenario 'When user click add a new transaction button will redirect to transaction new page' do
      visit group_entities_path(@group)
      click_link 'Add new transaction'
      expect(page).to have_content('ADD TRANSACTIONS')
    end
  end

  describe 'Entity new page' do
    scenario 'should have a entity new page' do
      visit new_group_entity_path(@group)
      expect(page).to have_content('ADD TRANSACTIONS')
    end

    scenario 'when the user clicks the save button with valid data, it will redirect to the entity detail page' do
      visit new_group_entity_path(@group)
      fill_in 'Name', with: 'Test entity'
      fill_in 'Amount', with: 100
      select 'Test group', from: 'entity[group_id]' # Corrected attribute name here
      click_button 'Save'
      expect(page).to have_content('Add new transaction')
    end
  end
end