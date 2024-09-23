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
      <div class="container-fluid page-body-wrapper full-page-wrapper">
        <div class="content-wrapper d-flex align-items-center auth">
          <div class="row flex-grow">
            <div class="col-lg-4 mx-auto">
              <div class="auth-form-light text-left p-5">
                <h4 class="font-weight-bold">Register</h4>
                <h6 class="font-weight-light">
                  Signing up is easy It only takes a few steps..
                </h6>
                <form class="pt-3" id="registerForm">
                  <div class="form-group">
                    <input
                      type="text"
                      class="form-control form-control-lg"
                      id="username"
                      name="username"
                      placeholder="Username"
                      required
                    />
                  </div>
                  <div class="form-group">
                    <input
                      type="email"
                      class="form-control form-control-lg"
                      id="email"
                      name="email"
                      placeholder="Email"
                      required
                    />
                  </div>
                  <div class="form-group">
                    <input
                      type="password"
                      class="form-control form-control-lg"
                      id="password"
                      name="password"
                      placeholder="Password"
                      required
                    />
                  </div>
                  <div class="form-group">
                    <input
                      type="password"
                      class="form-control form-control-lg"
                      id="confirmPassword"
                      name="confirmPassword"
                      placeholder="Confirm Password"
                      required
                    />
                  </div>
                  <div class="mt-3 d-grid gap-2">
                    <button
                      type="submit"
                      class="btn btn-block btn-gradient-primary btn-lg font-weight-medium auth-form-btn"
                    >
                      SIGN UP
                    </button>
                  </div>
                  <div class="text-center mt-4 font-weight-light">
                    Already have an account?
                    <a href="login.html" class="text-primary">Login</a>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
        <!-- content-wrapper ends -->
      </div>
      <!-- page-body-wrapper ends -->
    </div>
  </body>
</html>
