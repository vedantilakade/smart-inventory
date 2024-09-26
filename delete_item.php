<?php include 'head.php'; ?>

<?php
$id = $_GET['id'];
$query = "DELETE FROM inventory WHERE id = $id";

if (mysqli_query($con, $query)) {
    echo "<script>alert('Item deleted successfully!'); window.location.href = 'inventory.php';</script>";
} else {
    echo "<script>alert('Error deleting item.');</script>";
}
?>
