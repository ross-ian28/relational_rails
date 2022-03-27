require 'rails_helper'

RSpec.describe 'Snack new page' do
  before(:each) do
    @ferret1 = Ferret.create!(name:"Pabu", hungry: true, snack_count: 999)
    @ferret2 = Ferret.create!(name:"Loki", hungry: false, snack_count: 200)
    @snack1 = Snack.create!(name: "Peanut butter", ferret_safe: true, count: 30, ferret_id: @ferret1.id)
    @snack2 = Snack.create!(name: "Egg yolk", ferret_safe: true, count: 1, ferret_id: @ferret1.id)
    @snack3 = Snack.create!(name: "Carrots", ferret_safe: false, count: 8, ferret_id: @ferret2.id)
    visit "/ferrets/#{@ferret1.id}/snacks/new"
  end

  describe 'Snacks new' do
    it 'has form to add snack' do
      fill_in "Name", with: "Kibble"
      fill_in "Ferret safe", with: true
      fill_in "Count", with: 1000000

      click_button "Create snack"

      expect(page).to have_current_path("/snacks")

      expect(page).to have_content("Kibble")
    end
  end
end
