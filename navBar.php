<nav class="navbar default-layout-navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
  <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-start">
    <a class="navbar-brand brand-logo" href="index.php">
      <img src="assets/images/smart-inventory.svg" alt="logo" style="width: 250px; height: auto;" />
    </a>
    <a class="navbar-brand brand-logo-mini" href="index.php">
      <img src="assets/images/smart-inventory.png" alt="mini logo" style="width: 100px; height: auto;" />
    </a>
  </div>
  <div class="navbar-menu-wrapper d-flex align-items-stretch">
    <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
      <span class="mdi mdi-menu"></span>
    </button>
    <div class="search-field d-none d-md-block">
      <form id="inventorySearchForm" class="d-flex align-items-center h-100" method="GET" action="inventory.php">
        <div class="input-group">
          <div class="input-group-prepend bg-transparent">
            <i class="input-group-text border-0 mdi mdi-magnify"></i>
          </div>
          <input type="text" id="inventorySearch" name="search" class="form-control bg-transparent border-0" placeholder="Search Inventory" />
        </div>
      </form>
      <script>
        document.getElementById('inventorySearch').addEventListener('keypress', function (e) {
          // Check if the 'Enter' key is pressed
          if (e.key === 'Enter') {
            e.preventDefault();  // Prevent the default form submission behavior
            
            // Check if the current page is inventory.php
            if (window.location.pathname.includes('inventory.php')) {
              document.getElementById('inventorySearchForm').submit(); // Submit the search form
            } else {
              alert('You can only search inventory items while on the Inventory Management page.');
            }
          }
        });
      </script>
    </div>
    <ul class="navbar-nav navbar-nav-right d-none d-lg-flex">
      <?php if (isset($_SESSION['loggedin']) && $_SESSION['loggedin'] === true): ?>
        <li class="nav-item">
          <a class="nav-link" href="logout.php">
            <button class="btn btn-danger" style="margin-right: -30px;">Logout</button>
          </a>
        </li>
      <?php endif; ?>
    </ul>
    <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
      <span class="mdi mdi-menu"></span>
    </button>
  </div>
</nav>
