class School < ActiveRecord::Base
  validates :name, :ben, presence: true
  
  has_many :purchases,
    class_name: "SchoolPurchase",
    foreign_key: :ben,
    primary_key: :ben
    
  def average_cost_per_megabit
    total_cost, total_megabits = 0, 0
    purchases.each do |purchase|
      total_cost += purchase.cost
      total_megabits += purchase.bandwidth_in_megabits
    end
    total_cost / total_megabits
  end
end
