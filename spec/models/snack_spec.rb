require "rails_helper"

describe Snack, type: :model do
   describe "relationships" do
      it { should belong_to :ferret }
   end

   describe "validations" do
     it {should validate_presence_of :name}
     it {should validate_presence_of :count}
   end
end
