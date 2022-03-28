require 'rails_helper'

RSpec.describe 'Snack index page' do
  before(:each) do
    @ferret1 = Ferret.create!(name:"Pabu", hungry: true, snack_count: 999)
    @snack1 = @ferret1.snacks.create!(name: "Peanut butter", ferret_safe: true, count: 30)
    @snack2 = @ferret1.snacks.create!(name: "Egg yolk", ferret_safe: true, count: 1)
    @snack3 = @ferret1.snacks.create!(name: "Grapes", ferret_safe: false, count: 5)
    visit "/snacks"
  end

  describe 'Snack index' do
    it 'shows all snacks' do
      expect(page).to have_content(@snack1.name)
      expect(page).to have_content(@snack2.name)
    end
    it 'has only true boolean outputs' do
      within("#ferret_safe") do
        expect(page).to have_content("Ferret safe snacks:")
        expect(page).to have_content(@snack1.name)
        expect(page).to have_content(@snack2.name)
        expect(page).to have_no_content(@snack3.name)
      end
    end
  end
end
