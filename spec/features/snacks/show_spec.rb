require 'rails_helper'

RSpec.describe 'Snack show page' do
  before(:each) do
    @ferret1 = Ferret.create!(name:"Pabu", hungry: true, snack_count: 999)
    @snack1 = Snack.create!(name: "Peanut butter", ferret_safe: true, count: 30, ferret_id: @ferret1.id)
    @snack2 = Snack.create!(name: "Egg yolk", ferret_safe: true, count: 1, ferret_id: @ferret1.id)
    visit "/snacks/#{@snack1.id}"
  end

  describe 'Snack show' do
    it 'shows only snack' do
      expect(page).to have_content(@snack1.name)
      expect(page).to have_no_content(@snack2.name)
    end
    it 'shows snack attributes' do
      expect(page).to have_content('Ferret safe?:')
      expect(page).to have_content(@snack1.ferret_safe)
      expect(page).to have_content('Amount of snacks:')
      expect(page).to have_content(@snack1.count)
    end
  end
end
