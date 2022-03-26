require 'rails_helper'

RSpec.describe 'Ferret new page' do
  before(:each) do
    @ferret1 = Ferret.create!(name:"Pabu", hungry: true, snack_count: 999)
    @ferret2 = Ferret.create!(name:"Loki", hungry: false, snack_count: 200)
    visit "/ferrets/new"
  end

  describe 'Ferrets new' do
    it 'has form to add ferret' do
      fill_in "Name", with: "Apollo"
      fill_in "Hungry", with: true
      fill_in "Snack count", with: 50

      click_button "Create ferret"

      expect(page).to have_current_path("/ferrets")

      expect(page).to have_content("Apollo")
    end
  end
end
