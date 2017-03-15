function pieChart(inputJsonFile,index) {
    var jsonString = [];
    $.getJSON(inputJsonFile, function(data) {
        for (i = 0; i < data.length; i++) {
            var mydata={
                name:data[i].name,
                y:parseFloat(data[i].y)
            };
            jsonString.push(mydata);
        }
        var processed_json = jsonString

        Highcharts.chart('pieChart', {
            chart: {
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false,
                type: 'pie'
            },
            title: {
                text: 'Pie Chart of Topic '+ index+ '-Article Distribution'
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: false
                    },
                    showInLegend: true
                }
            },
            series: [{
                name: 'Brands',
                colorByPoint: true,
                data: processed_json
            }]
        });


    });
}
