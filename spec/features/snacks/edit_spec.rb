require 'rails_helper'

RSpec.describe 'Snack edit page' do
  before(:each) do
    @ferret1 = Ferret.create!(name:"Pabu", hungry: true, snack_count: 999)
    @snack1 = Snack.create!(name: "Peanut butter", ferret_safe: true, count: 30, ferret_id: @ferret1.id)
    @snack2 = Snack.create!(name: "Egg yolk", ferret_safe: true, count: 1, ferret_id: @ferret1.id)
    visit "/snacks/#{@snack1.id}/edit"
  end

  describe 'Snacks edit' do
    it 'has form to edit snack' do
      fill_in "Name", with: "Kibble"
      fill_in "Ferret safe", with: true
      fill_in "Count", with: 1000000

      click_button "Update snack"

      expect(page).to have_current_path("/snacks/#{@snack1.id}")

      expect(page).to have_content("Kibble")
    end
  end
end
