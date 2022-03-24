require 'rails_helper'

RSpec.describe 'Snack index page' do
  before(:each) do
    @ferret1 = Ferret.create!(name:"Pabu", hungry: true, snack_count: 999)
    @snack1 = Snack.create!(name: "Peanut butter", ferret_safe: true, count: 30, ferret_id: @ferret1.id)
    @snack2 = Snack.create!(name: "Egg yolk", ferret_safe: true, count: 1, ferret_id: @ferret1.id)
    visit "/snacks"
  end

  describe 'Snack index' do
    it 'shows all snacks' do
      expect(page).to have_content(@snack1.name)
      expect(page).to have_content(@snack2.name)
    end
  end
end
