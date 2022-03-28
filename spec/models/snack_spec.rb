require "rails_helper"

describe Snack, type: :model do
   describe "relationships" do
      it { should belong_to :ferret }
   end

   describe "validations" do
     it {should validate_presence_of :name}
     it {should validate_presence_of :count}
   end
   describe "instance methods" do
     describe "#ferret_safe_true" do
       before :each do
         @ferret1 = Ferret.create!(name:"Pabu", hungry: true, snack_count: 999)
         @snack1 = @ferret1.snacks.create!(name: "Peanut butter", ferret_safe: true, count: 30)
         @snack2 = @ferret1.snacks.create!(name: "Egg yolk", ferret_safe: true, count: 1)
         @snack3 = @ferret1.snacks.create!(name: "Grapes", ferret_safe: false, count: 5)
       end
       it 'returns only true snack objects' do
         expect(Snack.ferret_safe_true).to eq([@snack1, @snack2])
       end
     end
   end
end
