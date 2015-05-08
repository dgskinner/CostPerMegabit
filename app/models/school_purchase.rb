class SchoolPurchase < ActiveRecord::Base
  validates :ben, :bandwidth, :measure, :cost, presence: true
  
  belongs_to :school,
    class_name: "School",
    foreign_key: :ben,
    primary_key: :ben
    
  def bandwidth_in_megabits
    case measure
    when 'k' 
      return bandwidth / 1000.0
    when 'm'
      return bandwidth.to_i
    when 'g'
      return bandwidth * 1000.0
    when 't'
      return bandwidth * 1000000.0
    end
  end
  
  def cost_per_megabit
    return cost / bandwidth_in_megabits
  end
end
