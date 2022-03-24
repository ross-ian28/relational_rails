require 'rails_helper'

RSpec.describe 'ferrets show page' do
  before(:each) do
    @ferret1 = Ferret.create!(name:"Pabu", hungry: true, snack_count: 999)
    @ferret2 = Ferret.create!(name:"Loki", hungry: false, snack_count: 200)
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
  end
end