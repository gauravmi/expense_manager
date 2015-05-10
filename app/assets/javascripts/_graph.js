$(document).ready(function(){
        var chart = c3.generate({
            data: {
                columns: $('chart-category').data('chart'),
                type: 'bar'
            },
            bar: {
                width: {
                    ratio: 0.5
                }
            }
        });
})