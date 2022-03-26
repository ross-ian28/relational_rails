require 'rails_helper'

RSpec.describe 'ferrets show page' do
  before(:each) do
    @ferret1 = Ferret.create!(name:"Pabu", hungry: true, snack_count: 999)
    @ferret2 = Ferret.create!(name:"Loki", hungry: false, snack_count: 200)
    @snack1 = Snack.create!(name: "Peanut butter", ferret_safe: true, count: 30, ferret_id: @ferret1.id)
    @snack2 = Snack.create!(name: "Egg yolk", ferret_safe: true, count: 1, ferret_id: @ferret1.id)
    @snack3 = Snack.create!(name: "Carrots", ferret_safe: false, count: 8, ferret_id: @ferret1.id)
    visit "/ferrets/#{@ferret1.id}"
  end

  describe 'Ferrets show' do
    it 'shows one ferret' do
      expect(page).to have_content(@ferret1.name)
      expect(page).to have_no_content(@ferret2.name)
    end
    it 'shows ferret attributes' do
      expect(page).to have_content('Is hungry?:')
      expect(page).to have_content(@ferret1.hungry)
      expect(page).to have_content('Snacks eaten:')
      expect(page).to have_content(@ferret1.snack_count)
    end
    it 'shows number of snacks ferret has' do
      expect(page).to have_content('Different snack types owned:')
      expect(page).to have_content(3)
    end
    it 'has link to ferret snacks index' do
      click_link "#{@ferret1.name}'s snacks"
      expect(page).to have_current_path("/ferrets/#{@ferret1.id}/snacks")
    end
  end
end
