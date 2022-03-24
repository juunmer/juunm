$(document).ready(function() {
    // 빈 차트를 생성한다. 
    $.ajax({
        url: "http://localhost:8080//Ezen2Team/data/json.jsp", 
        type: 'get',
        dataType: 'json',
        success: function (data) {
            console.log(data);

      var userid = [];
      var facebook_follower = [];
      var twitter_follower = [];
      var googleplus_follower = [];

      for(var i in data) {
        userid.push("UserID " + data[i].userid);
        facebook_follower.push(data[i].facebook);
        twitter_follower.push(data[i].twitter);
        googleplus_follower.push(data[i].googleplus);
      }
            chart = new Chart(document.getElementById("myChart"), {
                type: 'line',
                data: {
                    labels: userid,
                    datasets: [
                        {
                            label: "facebook",
                            fill: false,
                            lineTension: 0.1,
                            backgroundColor: "rgba(59, 89, 152, 0.75)",
                            borderColor: "rgba(59, 89, 152, 1)",
                            pointHoverBackgroundColor: "rgba(59, 89, 152, 1)",
                            pointHoverBorderColor: "rgba(59, 89, 152, 1)",
                            data: facebook_follower
                          },
                          {
                            label: "twitter",
                            fill: false,
                            lineTension: 0.1,
                            backgroundColor: "rgba(29, 202, 255, 0.75)",
                            borderColor: "rgba(29, 202, 255, 1)",
                            pointHoverBackgroundColor: "rgba(29, 202, 255, 1)",
                            pointHoverBorderColor: "rgba(29, 202, 255, 1)",
                            data: twitter_follower
                          },
                          {
                            label: "googleplus",
                            fill: false,
                            lineTension: 0.1,
                            backgroundColor: "rgba(211, 72, 54, 0.75)",
                            borderColor: "rgba(211, 72, 54, 1)",
                            pointHoverBackgroundColor: "rgba(211, 72, 54, 1)",
                            pointHoverBorderColor: "rgba(211, 72, 54, 1)",
                            data: googleplus_follower
                          }
                    ],
                    borderWidth: 1
                },
            });
        },
        error: function (xhr, status, error) {
            // 블라블라
        },
        complete: function (data) {
            // 블라블라
        }
    })
});