require 'rails_helper'

RSpec.describe 'Ferrets snack index page' do
  before(:each) do
    @ferret1 = Ferret.create!(name:"Pabu", hungry: true, snack_count: 999)
    @ferret2 = Ferret.create!(name:"Loki", hungry: false, snack_count: 5)
    @snack1 = Snack.create!(name: "Peanut butter", ferret_safe: true, count: 30, ferret_id: @ferret1.id)
    @snack2 = Snack.create!(name: "Egg yolk", ferret_safe: true, count: 1, ferret_id: @ferret1.id)
    @snack3 = Snack.create!(name: "Carrots", ferret_safe: false, count: 8, ferret_id: @ferret2.id)
    visit "/ferrets/#{@ferret1.id}/snacks"
  end

  describe 'Ferret snack index' do
    it 'shows snacks belonging to ferret' do
      expect(page).to have_content("#{@ferret1.name}'s Snacks")
      expect(page).to have_content(@snack1.name)
      expect(page).to have_content(@snack2.name)
      expect(page).to have_no_content(@snack3.name)
    end
  end
end
