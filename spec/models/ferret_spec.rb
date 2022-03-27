require "rails_helper"

describe Ferret, type: :model do
   describe "relationships" do
      it { should have_many :snacks }
   end
   describe "validations" do
      it {should validate_presence_of :name}
      it {should validate_presence_of :snack_count}
   end
   describe "instance methods" do
     describe "#snacks_true" do
       before :each do
         @ferret1 = Ferret.create!(name:"Pabu", hungry: true, snack_count: 999)
         @snack1 = @ferret1.snacks.create!(name: "Peanut butter", ferret_safe: true, count: 30)
         @snack2 = @ferret1.snacks.create!(name: "Egg yolk", ferret_safe: true, count: 1)
         @snack3 = @ferret1.snacks.create!(name: "Grapes", ferret_safe: false, count: 3)
       end
       it 'only shows snacks with ferret safe column true' do
         expect(@ferret1.snack_true).to eq([@snack1, @snack2])
       end
     end
   end
end
