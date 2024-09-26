<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <title>Smart Inventory</title>
  <?php include 'head.php'; ?>
</head>
<body>
  <div class="container-scroller">
    <?php include 'navBar.php'; ?>
    <div class="container-fluid page-body-wrapper">
      <?php include 'sidebar.php'; ?>
      <div class="main-panel">
        <div class="content-wrapper">
          <div class="page-header">
            <h3 class="page-title">
              <span class="page-title-icon bg-gradient-primary text-white me-2">
                <i class="mdi mdi-view-list menu-icon"></i>
              </span>
              Inventory Management
            </h3>
          </div>

          <div class="container">
            <div class="mb-3">
              <a href="add_item.php" class="btn btn-primary btn-block d-md-inline-block d-block">Add New Item</a>
            </div>

            <div class="table-responsive">
              <table class="table table-bordered">
                <thead>
                  <tr>
                    <th>Name</th>
                    <th>Quantity</th>
                    <th>Location</th>
                    <th>Last Updated</th>
                    <th>Actions</th>
                  </tr>
                </thead>
                <tbody>
                  <?php
                  // Check if a search term is set in the GET request
                  $searchTerm = isset($_GET['search']) ? mysqli_real_escape_string($con, $_GET['search']) : '';

                  // Modify the query to filter by name if a search term is provided
                  if ($searchTerm) {
                    $query = "SELECT * FROM inventory WHERE name LIKE '%$searchTerm%' ORDER BY last_updated DESC";
                  } else {
                    $query = "SELECT * FROM inventory ORDER BY last_updated DESC";
                  }

                  // Execute the query
                  $result = mysqli_query($con, $query);

                  // Display the results in the table
                  if (mysqli_num_rows($result) > 0) {
                    while ($row = mysqli_fetch_assoc($result)) {
                      echo "<tr>";
                      echo "<td>" . $row['name'] . "</td>";
                      echo "<td>" . $row['quantity'] . "</td>";
                      echo "<td>" . $row['location'] . "</td>";
                      echo "<td>" . $row['last_updated'] . "</td>";
                      echo "<td>
                              <a href='edit_item.php?id=" . $row['id'] . "' class='btn btn-warning btn-sm'>Edit</a>
                              <a href='delete_item.php?id=" . $row['id'] . "' class='btn btn-danger btn-sm'>Delete</a>
                            </td>";
                      echo "</tr>";
                    }
                  } else {
                    echo "<tr><td colspan='5'>No items found.</td></tr>";
                  }
                  ?>
                </tbody>
              </table>
            </div>

          </div>

        </div>
      </div>
    </div>
  </div>
  <?php include 'footer.php'; ?>
</body>
</html>
