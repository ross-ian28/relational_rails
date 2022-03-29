require 'rails_helper'

RSpec.describe 'Ferret index page' do
  before(:each) do
    @ferret1 = Ferret.create!(name:"Pabu", hungry: true, snack_count: 999)
    @ferret2 = Ferret.create!(name:"Loki", hungry: false, snack_count: 200)
    visit "/ferrets"
  end

  describe 'Ferrets index' do
    it 'shows all ferrets' do
      expect(page).to have_content(@ferret1.name)
      expect(page).to have_content(@ferret2.name)
    end
    it 'orders ferrets by most recent' do
      expect(page).to have_content('Created at:')
    end
    it 'has link to make new ferret' do
      click_link 'New ferret'
      expect(page).to have_current_path("/ferrets/new")
    end
    it 'has links to edit each parent' do
      click_link "Edit #{@ferret1.name}"
      expect(current_path).to eq("/ferrets/#{@ferret1.id}/edit")
      fill_in "Name", with: "Luffy"
      fill_in "Hungry", with: true
      fill_in "Snack count", with: 100
      click_button "Update ferret"
      expect(current_path).to eq("/ferrets/#{@ferret1.id}")
      expect(page).to have_content("Luffy")
    end
  end
end
