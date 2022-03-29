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
    it 'has link to make new snack' do
      click_link 'Create snack'
      expect(page).to have_current_path("/ferrets/#{@ferret1.id}/snacks/new")
    end
    it 'has links to edit each child' do
      click_link "Edit #{@snack1.name}"
      expect(current_path).to eq("/snacks/#{@snack1.id}/edit")
      fill_in "Name", with: "Kibble"
      fill_in "Ferret safe", with: true
      fill_in "Count", with: 100000
      click_button "Update snack"
      expect(current_path).to eq("/snacks/#{@snack1.id}")
      expect(page).to have_content("Kibble")
    end
  end
end
