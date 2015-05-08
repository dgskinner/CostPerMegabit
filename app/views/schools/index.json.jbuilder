json.array!(@schools) do |school|
	json.name school.name
	json.ben school.ben
	json.avgCost school.average_cost_per_megabit
end