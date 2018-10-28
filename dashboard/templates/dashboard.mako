<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
##     <link rel="icon" href="../../../../favicon.ico">

    <title>Dashboard Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="${request.static_url("dashboard:static/css/bootstrap.min.css")}" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${request.static_url("dashboard:static/css/dashboard.css")}" rel="stylesheet">
  </head>

  <body>
    <nav class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow">
      <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#">Company name</a>
      <input class="form-control form-control-dark w-100" type="text" placeholder="Search" aria-label="Search">
      <ul class="navbar-nav px-3">
        <li class="nav-item text-nowrap">
          <a class="nav-link" href="#">Sign out</a>
        </li>
      </ul>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <nav class="col-md-2 d-none d-md-block bg-light sidebar">
          <div class="sidebar-sticky">
            <ul class="nav flex-column">
              <li class="nav-item">
                <a class="nav-link active" href="#">
                  <span data-feather="home"></span>
                  Dashboard <span class="sr-only">(current)</span>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="${request.route_url("personal_config")}">
                  <span data-feather="file"></span>
                  Orders
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" type="submit" onclick="refresh_table()">
                  <span data-feather="file"></span>
                  Refresh
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="${request.route_url("home_page")}">
                  <span data-feather="file"></span>
                  Home
                </a>
              </li>
            </ul>

            <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
              <span>Saved reports</span>
              <a class="d-flex align-items-center text-muted" href="#">
                <span data-feather="plus-circle"></span>
              </a>
            </h6>
            <ul class="nav flex-column mb-2">
              <li class="nav-item">
                <a class="nav-link" href="#">
                  <span data-feather="file-text"></span>
                  Current month
                </a>
              </li>

            </ul>
          </div>
        </nav>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
          <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
            <h1 class="h2">Dashboard</h1>
            <div class="btn-toolbar mb-2 mb-md-0">
              <div class="btn-group mr-2">
                <button class="btn btn-sm btn-outline-secondary">Share</button>
                <button class="btn btn-sm btn-outline-secondary">Export</button>
              </div>
              <button class="btn btn-sm btn-outline-secondary dropdown-toggle">
                <span data-feather="calendar"></span>
                This week
              </button>
            </div>
          </div>

          <canvas class="my-4 w-100" id="myChart" width="900" height="380"></canvas>

          <h2>Section title</h2>
          <div class="table-responsive">
            <table class="table table-striped table-sm">
              <thead>
                <tr>
                  <th>#</th>
                  <th>Header</th>
                  <th>Header</th>
                  <th>Header</th>
                  <th>Header</th>
                </tr>
              </thead>
              <tbody>
                % for row in rows:
                    ${makerow(row)}
                % endfor
              </tbody>
            </table>
          </div>
        </main>
      </div>
    </div>

    <!-- Defined mako python
    ================================================== -->
    <%def name="makerow(row)">
    <tr>
        <td>${row['id_number']}</td>
        <td>${row['name']}</td>
        <td>${row['v1']}</td>
        <td>${row['v2']}</td>
        <td>${row['v3']}</td>
    </tr>
    </%def>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="${request.static_url("dashboard:static/js/jquery-3.3.1.min.js")}" ></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
    <script src="${request.static_url("dashboard:static/js/popper.min.js")}"></script>
    <script src="${request.static_url("dashboard:static/js/bootstrap.min.js")}"></script>

    <!-- Icons -->
    <script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
    <script>
      feather.replace()
    </script>

    <!-- Graphs -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>
    <script>

        function refresh_table(){
        $.post("${request.route_url("chart_data")}", {"entity":123, "color":123})
          .done(function(data){
                d_json=JSON.parse(data)
                if(d_json.state=="success"){
                   var ctx = document.getElementById("myChart");
                   var myChart = new Chart(ctx, {
                     type: 'line',
                     data: {
                       labels: ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"],
                       datasets: [{
                         data: d_json.data,
                         lineTension: 0,
                         backgroundColor: 'transparent',
                         borderColor: '#007bff',
                         borderWidth: 4,
                         pointBackgroundColor: '#007bff'
                       }]
                     },
                     options: {
                       scales: {
                         yAxes: [{
                           ticks: {
                             beginAtZero: false
                           }
                         }]
                       },
                       legend: {
                         display: false,
                       }
                     }
                   });


                }
                else{ alert(d_json.state); }
          });

    }
    refresh_table()
      ##  var ctx = document.getElementById("myChart");
      ##  var myChart = new Chart(ctx, {
      ##    type: 'line',
      ##    data: {
      ##      labels: ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"],
      ##      datasets: [{
      ##        data: {}, //[15339, 21345, 18483, 24003, 23489, 24092, 12034],
      ##        lineTension: 0,
      ##        backgroundColor: 'transparent',
      ##        borderColor: '#007bff',
      ##        borderWidth: 4,
      ##        pointBackgroundColor: '#007bff'
      ##      }]
      ##    },
      ##    options: {
      ##      scales: {
      ##        yAxes: [{
      ##          ticks: {
      ##            beginAtZero: false
      ##          }
      ##        }]
      ##      },
      ##      legend: {
      ##        display: false,
      ##      }
      ##    }
      ##  });
    </script>
  </body>
</html>
