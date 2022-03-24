require "rails_helper"

describe Ferret, type: :model do
   describe "relationships" do
      it { should have_many :snacks }
   end
   
   describe "validations" do
      it {should validate_presence_of :name}
      it {should validate_presence_of :hungry}
      it {should validate_presence_of :snack_count}
   end
end
