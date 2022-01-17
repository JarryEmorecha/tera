// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';
// Bar Chart Example
alert("olok")
var ctx = document.getElementById("myBarChart");
var myLineChart = new Chart(ctx, {
  type: 'bar',
  data: {
    labels: ["Springer Open", "Science Direct", "Scirp", "t&f online", "Herdin", "Zlibrary", "Cambridge Core", "Wiley Online Library - CELph", "Wiley Online Library - ALBASA ", "ProQuest Elibrary", "Philippine Ebook Hub"],
    datasets: [{
      label: "Access",
      backgroundColor: "rgba(191, 63, 63)",
      borderColor: "rgba(243, 246, 85)",
      data: [4215, 1312, 6251, 7841, 9821, 4984,1233,2342,4343,2345,3234],
    }],
  },
  options: {
    scales: {
      xAxes: [{
        time: {
          unit: 'sites'
        },
        gridLines: {
          display: false
        },
        ticks: {
          maxTicksLimit: 11
        }
      }],
      yAxes: [{
        ticks: {
          min: 0,
          max: 15000,
          maxTicksLimit: 8
        },
        gridLines: {
          display: true
        }
      }],
    },
    legend: {
      display: false
    }
  }
});
