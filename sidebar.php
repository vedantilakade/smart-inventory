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
            <!-- partial:partials/_sidebar.html -->
            <nav class="sidebar sidebar-offcanvas" id="sidebar">
          <ul class="nav">
            <li class="nav-item">
              <a class="nav-link" href="index.html">
                <span class="menu-title">Dashboard</span>
                <i class="mdi mdi-home menu-icon"></i>
              </a>
            </li>
            <li class="nav-item">
              <a
                class="nav-link"
                data-bs-toggle="collapse"
                href="#auth"
                aria-expanded="false"
                aria-controls="auth"
              >
                <span class="menu-title">Pages</span>
                <i class="menu-arrow"></i>
              </a>
              <div class="collapse" id="auth">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item">
                    <a class="nav-link" href="login.php"> Login </a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="register.php">
                      Register
                    </a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="pages/error-404.php"> 404 </a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="pages/error-500.php"> 500 </a>
                  </li>
                </ul>
              </div>
            </li>
          </ul>
        </nav>
  </body>
</html>
