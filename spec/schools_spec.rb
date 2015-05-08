require "spec_helper"

describe School do 
  describe "#average_cost_per_megabit" do
    it "finds the average cost if the school has only one purchase" do 
      school = School.create({ben: 123, name: "Cool School"})
      purchase = SchoolPurchase.create({ben: 123, bandwidth: 400, measure: "k", cost: 10})
      expect(school.average_cost_per_megabit).to eq(25)
    end
    
    it "finds the average cost if the school has multiple purchases" do 
      school = School.create({ben: 123, name: "Cool School"})
      purchase = SchoolPurchase.create({ben: 123, bandwidth: 200, measure: "m", cost: 20})
      purchase = SchoolPurchase.create({ben: 123, bandwidth: 100, measure: "g", cost: 30})
      expect(school.average_cost_per_megabit.round(5)).to eq(0.00060)
    end
  end
end