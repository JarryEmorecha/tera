$('#startDate, #endDate').datepicker({
    beforeShow: setDateRange,
    dateFormat: "mm/dd/yy",
    firstDay: 1,
    changeFirstDay: false,
    onChange: function() { $(this).valid(); },
    onSelect: function() {
        if (this.id == 'startDate') {
            // If selected start date is later than currently selected
            // end date, set end date to start date + 1 day
            var date = $('#startDate').datepicker('getDate');
            if (date) { date.setDate(date.getDate() + 1); }
            $('#endDate').datepicker('option', 'minDate', date);
        }
    }
});

function setDateRange(input) {
    var min = null, dateMin = min, dateMax = null, dayRange = 30;
    var opt = $('#select1'), start = $('#startDate'), end = $('#endDate');
    if (opt.val() == '1') {
        // Adjust min date for start date
        if (input.id == 'startDate') {
            // Set min date if end date has a value
            if ($('#endDate').datepicker('getDate') != null) {
                dateMax = $('#endDate').datepicker('getDate');
                dateMin = $('#endDate').datepicker('getDate');
                dateMin.setDate(dateMin.getDate() - dayRange);
                if (dateMin < min) { dateMin = min; }
            }
        // Adjust max date for end date
        } else if (input.id == 'endDate') {
            dateMin = $('#startDate').datepicker('getDate');
            // Set date range of 30 days
            dateMax = new Date(dateMin.getFullYear(), dateMin.getMonth(), dateMin.getDate() + 30);
            // Set max date if start date has a value
            if ($('#startDate').datepicker('getDate') != null) {
                var rangeMax = new Date(dateMin.getFullYear(), dateMin.getMonth(), dateMin.getDate() + dayRange);
                if (rangeMax < dateMax) { dateMax = rangeMax; }
            }
        }
    } else if (opt.val() != '1') {
        if (input.id == 'startDate') {
            if ($('#endDate').datepicker('getDate') != null) {
                dateMin = null;
            }
        } else if (input.id == 'endDate') {
            dateMin = $('#startDate').datepicker('getDate');
            dateMax = null;
            if ($('#startDate').datepicker('getDate') != null) { dateMax = null; }
        }
    }
    return {
        minDate: dateMin,
        maxDate: dateMax
    };
}

$('#select1').change(function() {
    $('#startDate, #endDate').val('');
    $('#startDate, #endDate').removeAttr('disabled');
});