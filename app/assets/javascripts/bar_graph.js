var schoolData = [["BEN", "Average Cost", {role: 'style'}]];
	
function addSchoolData() {	
	$.getJSON("schools", function(data){
		data.forEach(function(school) {
			schoolData.push([school.ben + " (" + school.name + ")", parseFloat((100 * school.avgCost).toFixed(5)), 'orange']);
		});
	});
	
	organizations.forEach(function(school) {
		var totalCost = 0;
		var totalBandwidth = 0;
		school.purchases.forEach(function(purchase) {
			totalCost += purchase.cost;
			totalBandwidth += bandwidthInMegabits(purchase.bandwidth, purchase.measure);
		});
		schoolData.push([school.ben + " (" + school.name + ")", parseFloat((100 * totalCost / totalBandwidth).toFixed(5)), 'orange']);
	});
}

addSchoolData();

function bandwidthInMegabits(value, measure) {
	if (measure === "k") {
		return value / 1000;
	} else if (measure === "m") {
		return value;
	} else if (measure === "g") {
		return value * 1000;
	} else {
		return value * 1000000;
	}
}

// https://developers.google.com/chart/interactive/docs/gallery/columnchart

google.load("visualization", "1", {packages:["corechart"]});
google.setOnLoadCallback(drawChart);

function drawChart() {
    var data = google.visualization.arrayToDataTable(schoolData);
	
    var view = new google.visualization.DataView(data);
    view.setColumns([0, 1,
                     { calc: "stringify",
                       sourceColumn: 1,
                       type: "string",
                       role: "annotation" },
                     2]);

    var options = {
      title: "Average Amount Schools Spend on Bandwidth (cents/megabit)",
      width: 1400,
      height: 800,
      bar: {groupWidth: "90%"},
	  legend: { position: "none" }
    };
    var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
    chart.draw(view, options);
}