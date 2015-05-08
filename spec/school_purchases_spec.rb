require "spec_helper"

describe SchoolPurchase do 
  describe "#bandwidth_in_megabits" do
    it "converts kilobits to megabits" do 
      purchase = SchoolPurchase.new({ben: 1, bandwidth: 15, measure: "k", cost: 5})
      expect(purchase.bandwidth_in_megabits).to eq(0.015)
    end
    
    it "converts gigabits to megabits" do 
      purchase = SchoolPurchase.new({ben: 1, bandwidth: 15, measure: "g", cost: 5})
      expect(purchase.bandwidth_in_megabits).to eq(15000)
    end
    
    it "converts terabits to megabits" do 
      purchase = SchoolPurchase.new({ben: 1, bandwidth: 15, measure: "t", cost: 5})
      expect(purchase.bandwidth_in_megabits).to eq(15000000)
    end
    
    it "returns megabits if bandwith is already measured in megabits" do
      purchase = SchoolPurchase.new({ben: 1, bandwidth: 15, measure: "m", cost: 5})
      expect(purchase.bandwidth_in_megabits).to eq(15)
    end
  end
  
  describe "#cost_per_megabit" do
    it "returns the cost per megabit if bandwith is given in megabits" do
      purchase = SchoolPurchase.new({ben: 1, bandwidth: 10, measure: "m", cost: 20})
      expect(purchase.cost_per_megabit).to eq(2)
    end
    
    it "returns the cost per megabit if bandwith is not already given in megabits" do
      purchase = SchoolPurchase.new({ben: 1, bandwidth: 10, measure: "t", cost: 20})
      expect(purchase.cost_per_megabit).to eq(0.000002)      
    end
  end
end

