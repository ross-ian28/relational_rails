require 'rails_helper'

RSpec.describe 'Ferret edit page' do
  before(:each) do
    @ferret1 = Ferret.create!(name:"Pabu", hungry: true, snack_count: 999)
    @ferret2 = Ferret.create!(name:"Loki", hungry: false, snack_count: 200)
    visit "/ferrets/#{@ferret1.id}/edit"
  end

  describe 'Ferrets edit' do
    it 'has form to update ferret' do
      fill_in "Name", with: "Luffy"
      fill_in "Hungry", with: true
      fill_in "Snack count", with: 100

      click_button "Update ferret"

      expect(page).to have_current_path("/ferrets/#{@ferret1.id}")

      expect(page).to have_content("Luffy")
      expect(page).to have_content(100)
    end
  end
end
