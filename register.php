<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Smart Inventory</title>
    <?php include 'head.php'; ?>
  </head>
  <body>

  <?php
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Get form data
    $username = mysqli_real_escape_string($con, $_POST['username']);
    $email = mysqli_real_escape_string($con, $_POST['email']);
    $password = mysqli_real_escape_string($con, $_POST['password']);
    $confirmPassword = mysqli_real_escape_string($con, $_POST['confirmPassword']);

    // Check if passwords match
    if ($password !== $confirmPassword) {
        echo "<script>alert('Passwords do not match!');</script>";
    } else {
        // Hash the password for security
        $hashedPassword = password_hash($password, PASSWORD_DEFAULT);

        // Check if the username or email already exists
        $checkUser = mysqli_query($con, "SELECT * FROM users WHERE username = '$username' OR email = '$email'");
        if (mysqli_num_rows($checkUser) > 0) {
            echo "<script>alert('Username or Email already exists!');</script>";
        } else {
            // Insert the user into the database
            $query = "INSERT INTO users (username, email, password) VALUES ('$username', '$email', '$hashedPassword')";
            if (mysqli_query($con, $query)) {
                echo "<script>alert('Registration successful!'); window.location.href = 'login.php';</script>";
            } else {
                echo "<script>alert('Error in registration. Please try again.');</script>";
            }
        }
    }
}
?>

  <div class="container-scroller">
      <div class="container-fluid page-body-wrapper full-page-wrapper">
        <div class="content-wrapper d-flex align-items-center auth">
          <div class="row flex-grow">
            <div class="col-lg-4 mx-auto">
              <div class="auth-form-light text-left p-5">
                <h4 class="font-weight-bold">Register</h4>
                <h6 class="font-weight-light">
                  Signing up is easy. It only takes a few steps.
                </h6>
                <form class="pt-3" method="POST" action="">
                  <div class="form-group">
                    <input type="text" class="form-control form-control-lg" id="username" name="username" placeholder="Username" required />
                  </div>
                  <div class="form-group">
                    <input type="email" class="form-control form-control-lg" id="email" name="email" placeholder="Email" required />
                  </div>
                  <div class="form-group">
                    <input type="password" class="form-control form-control-lg" id="password" name="password" placeholder="Password" required />
                  </div>
                  <div class="form-group">
                    <input type="password" class="form-control form-control-lg" id="confirmPassword" name="confirmPassword" placeholder="Confirm Password" required />
                  </div>
                  <div class="mt-3 d-grid gap-2">
                    <button type="submit" class="btn btn-block btn-gradient-primary btn-lg font-weight-medium auth-form-btn">SIGN UP</button>
                  </div>
                  <div class="text-center mt-4 font-weight-light">
                    Already have an account?
                    <a href="login.php" class="text-primary">Login</a>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
