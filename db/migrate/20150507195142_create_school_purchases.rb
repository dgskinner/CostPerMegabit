class CreateSchoolPurchases < ActiveRecord::Migration
  def change
    create_table :school_purchases do |t|
      t.string :ben, null: false
      t.integer :bandwidth, null: false
      t.string :measure, null: false
      t.integer :cost, null: false
    end
  end
end
