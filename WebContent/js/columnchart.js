function columnchart(inputJsonFile,index) {
    var jsonString = [];
    var jsonStringName = [];
    var jsonStringData = [];
    $.getJSON(inputJsonFile, function(data) {

        for (i = 0; i < data.length; i++) {
            var mydata={
                name:data[i].name,
                y:parseFloat(data[i].y)
            };
            jsonString.push(mydata);
        }

        var processed_json = jsonString

        processed_json = listSortBy(processed_json, 'y', 'desc');

        for (i = 0; i < processed_json.length; i++) {
            jsonStringName.push(processed_json[i].name);
            jsonStringData.push(parseFloat(processed_json[i].y));
        }

        var chart = Highcharts.chart('columnChart', {

            title: {
                text: 'Column Chart of Topic '+index+'-Article Distribution'
            },


            xAxis: {
                categories: jsonStringName
            },

            series: [{
                type: 'column',
                colorByPoint: true,
                data: jsonStringData,
                showInLegend: false
            }]

        });
    });

}

function listSortBy(arr, field, order){ 
    var refer = [], result=[], order = order=='asc'?'asc':'desc', index; 
    for(i=0; i<arr.length; i++){ 
        refer[i] = arr[i][field]+':'+i; 
    } 
    refer.sort(); 
    if(order=='desc') refer.reverse(); 
    for(i=0;i<refer.length;i++){ 
        index = refer[i].split(':')[1]; 
        result[i] = arr[index]; 
    } 
    return result; 
}

