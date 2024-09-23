<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <title>Smart Inventory</title>
    <?php include 'head.php'; ?>
  </head>
  <body>
    <div class="container-scroller">
    <?php include 'navBar.php'; ?>
      <!-- partial -->
      <div class="container-fluid page-body-wrapper">
        <?php include 'sidebar.php'; ?>
        <!-- partial -->
        <div class="main-panel">
          <div class="content-wrapper">
            <div class="page-header">
              <h3 class="page-title">
                <span
                  class="page-title-icon bg-gradient-primary text-white me-2"
                >
                  <i class="mdi mdi-home"></i>
                </span>
                Dashboard
              </h3>
            </div>
            <div class="row">
              <div class="col-md-4 stretch-card grid-margin">
                <div class="card bg-gradient-danger card-img-holder text-white">
                  <div class="card-body">
                    <img
                      src="assets/images/dashboard/circle.svg"
                      class="card-img-absolute"
                      alt="circle-image"
                    />
                    <h4 class="font-weight-normal mb-3">
                      Weekly Sales
                      <i class="mdi mdi-chart-line mdi-24px float-end"></i>
                    </h4>
                    <h2 class="mb-5">15,0000</h2>
                    <h6 class="card-text">Increased by 60%</h6>
                  </div>
                </div>
              </div>
              <div class="col-md-4 stretch-card grid-margin">
                <div class="card bg-gradient-info card-img-holder text-white">
                  <div class="card-body">
                    <img
                      src="assets/images/dashboard/circle.svg"
                      class="card-img-absolute"
                      alt="circle-image"
                    />
                    <h4 class="font-weight-normal mb-3">
                      Weekly Orders
                      <i
                        class="mdi mdi-bookmark-outline mdi-24px float-end"
                      ></i>
                    </h4>
                    <h2 class="mb-5">45,6334</h2>
                    <h6 class="card-text">Decreased by 10%</h6>
                  </div>
                </div>
              </div>
              <div class="col-md-4 stretch-card grid-margin">
                <div
                  class="card bg-gradient-success card-img-holder text-white"
                >
                  <div class="card-body">
                    <img
                      src="assets/images/dashboard/circle.svg"
                      class="card-img-absolute"
                      alt="circle-image"
                    />
                    <h4 class="font-weight-normal mb-3">
                      Yearly Sales
                      <i class="mdi mdi-diamond mdi-24px float-end"></i>
                    </h4>
                    <h2 class="mb-5">95,5741</h2>
                    <h6 class="card-text">Increased by 5%</h6>
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-7 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">Stock Inventory Status</h4>
                    <div class="table-responsive">
                      <table class="table">
                        <thead>
                          <tr>
                            <th>#</th>
                            <th>Item Name</th>
                            <th>Stock Date</th>
                            <th>Stock Level</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td>1</td>
                            <td>Rice</td>
                            <td>Oct 01, 2023</td>
                            <td>
                              <div class="progress">
                                <div
                                  class="progress-bar bg-gradient-success"
                                  role="progressbar"
                                  style="width: 80%"
                                  aria-valuenow="80"
                                  aria-valuemin="0"
                                  aria-valuemax="100"
                                ></div>
                              </div>
                            </td>
                          </tr>
                          <tr>
                            <td>2</td>
                            <td>Wheat</td>
                            <td>Sep 15, 2023</td>
                            <td>
                              <div class="progress">
                                <div
                                  class="progress-bar bg-gradient-danger"
                                  role="progressbar"
                                  style="width: 30%"
                                  aria-valuenow="30"
                                  aria-valuemin="0"
                                  aria-valuemax="100"
                                ></div>
                              </div>
                            </td>
                          </tr>
                          <tr>
                            <td>3</td>
                            <td>Sugar</td>
                            <td>Aug 20, 2023</td>
                            <td>
                              <div class="progress">
                                <div
                                  class="progress-bar bg-gradient-warning"
                                  role="progressbar"
                                  style="width: 50%"
                                  aria-valuenow="50"
                                  aria-valuemin="0"
                                  aria-valuemax="100"
                                ></div>
                              </div>
                            </td>
                          </tr>
                          <tr>
                            <td>4</td>
                            <td>Tea</td>
                            <td>Jul 10, 2023</td>
                            <td>
                              <div class="progress">
                                <div
                                  class="progress-bar bg-gradient-primary"
                                  role="progressbar"
                                  style="width: 70%"
                                  aria-valuenow="70"
                                  aria-valuemin="0"
                                  aria-valuemax="100"
                                ></div>
                              </div>
                            </td>
                          </tr>
                          <tr>
                            <td>5</td>
                            <td>Oil</td>
                            <td>Jun 05, 2023</td>
                            <td>
                              <div class="progress">
                                <div
                                  class="progress-bar bg-gradient-danger"
                                  role="progressbar"
                                  style="width: 40%"
                                  aria-valuenow="40"
                                  aria-valuemin="0"
                                  aria-valuemax="100"
                                ></div>
                              </div>
                            </td>
                          </tr>
                          <tr>
                            <td>6</td>
                            <td>Spices</td>
                            <td>May 25, 2023</td>
                            <td>
                              <div class="progress">
                                <div
                                  class="progress-bar bg-gradient-info"
                                  role="progressbar"
                                  style="width: 60%"
                                  aria-valuenow="60"
                                  aria-valuemin="0"
                                  aria-valuemax="100"
                                ></div>
                              </div>
                            </td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- content-wrapper ends -->
        </div>
        <!-- main-panel ends -->
      </div>
      <!-- page-body-wrapper ends -->
    </div>
    <!-- container-scroller -->
    <?php include 'footer.php'; ?>
  </body>
</html>
