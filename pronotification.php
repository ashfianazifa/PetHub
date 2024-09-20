<?php
session_start();
include 'php/db_conn1.php'; 

if (!isset($_SESSION['id'])) {
    echo "Please log in to continue.";
    exit();
}

$id = $_SESSION['id']; 
$product_notifications = "";
$adopt_notifications = "";
$report_notifications = "";
$update_check_time_sql = "UPDATE recusers SET last_notification_check = NOW() WHERE user_id = :id";
$update_check_time_stmt = $conn->prepare($update_check_time_sql);
$update_check_time_stmt->bindParam(':id', $id, PDO::PARAM_INT);
$update_check_time_stmt->execute();

$cart_check_sql = "
    SELECT c.product_id, c.user_id1, c.created_at, ru.username
    FROM cart c
    JOIN recusers ru ON c.user_id1 = ru.user_id
    WHERE c.product_id IN (SELECT product_id FROM productsell WHERE id = :id)
    ORDER BY created_at ASC";
$cart_check_stmt = $conn->prepare($cart_check_sql);
$cart_check_stmt->bindParam(':id', $id, PDO::PARAM_INT);
$cart_check_stmt->execute();

if ($cart_check_stmt->rowCount() > 0) {
    while ($row = $cart_check_stmt->fetch(PDO::FETCH_ASSOC)) {
        $product_notifications = 'Your product with ID ' . $row['product_id'] . ' has been added to the cart by ' . $row['username'] . ' on ' . $row['created_at'] . "<br>" . $product_notifications;
    }
} else {
    $product_notifications = 'No new product notifications.<br>' . $product_notifications;
}
$adopt_check_sql = "
    SELECT pc.pet_id, pc.user_id1, pc.created_at, ru.username
    FROM petcart pc
    JOIN recusers ru ON pc.user_id1 = ru.user_id
    WHERE pc.pet_id IN (SELECT pet_id FROM giveAdopt WHERE id = :id)
    ORDER BY created_at ASC";
$adopt_check_stmt = $conn->prepare($adopt_check_sql);
$adopt_check_stmt->bindParam(':id', $id, PDO::PARAM_INT);
$adopt_check_stmt->execute();

if ($adopt_check_stmt->rowCount() > 0) {
    while ($row = $adopt_check_stmt->fetch(PDO::FETCH_ASSOC)) {
        $adopt_notifications = 'Your pet with ID ' . $row['pet_id'] . ' has been adopted by ' . $row['username'] . ' on ' . $row['created_at'] . "<br>" . $adopt_notifications;
    }
} else {
    $adopt_notifications = 'No new adoption notifications.<br>' . $adopt_notifications;
}

$report_check_sql = "
    SELECT * FROM reportapro
    WHERE id = :id AND reportnop = 1
    ORDER BY created_at ASC";
$report_check_stmt = $conn->prepare($report_check_sql);
$report_check_stmt->bindParam(':id', $id, PDO::PARAM_INT);
$report_check_stmt->execute();

if ($report_check_stmt->rowCount() > 0) {
    while ($row = $report_check_stmt->fetch(PDO::FETCH_ASSOC)) {
        $report_notifications = 'Someone reported you on ' . $row['created_at'] . "<br>" . $report_notifications;
    }
} else {
    $report_notifications = 'No reports on your account.<br>' . $report_notifications;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <style>
        .icon-wrapper i {
            font-size: 1.5rem; 
            color: #000;


        }
        .notification-container {
            display: flex;
            justify-content: space-between;
            width: 100%;
        }
        .notification-column {
            width: 32%;
            padding: 15px;
            box-sizing: border-box;
            border: 1px solid black;
            border-radius: 20px;
            background-color: rgb(206, 197, 233);
        }
        .notification-column h3 {
            text-align: center;
            border-bottom: 1px solid black;
            padding-bottom: 10px;
            margin-bottom: 10px;
        }
        .logo-middle {
            position: absolute;
            display: flex;
            top: 10px;
            left: 120px;
            z-index: 10;
        }
        .logo-middle-img {
           height: 100px;
           width: 120px;
           margin-top:-10px;
           margin-left: 120px;
        }
        .title {
            position: absolute;
            display: flex;
            top: -5px;
            left: 45%;
            z-index: 10;
            color: black;
            font-weight: bold;
            font-size: 2rem;
            margin-top: 17px;
        }

        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            height: 50px;
            padding: 0 20px;
            box-shadow: 1px 1px 1px 1px lightgrey;
        }
    </style>
    <title>Notifications</title>
</head>
<body>
    <header>
        <div class="icon-wrapper">
            <a href="Provider_home.php"> 
            <i class="fa-regular fa-circle-left fa-2x"></i> 
            </a>
        </div> 
        <div class="ms-5 logo-middle">
            <a>
            <img src="new/redpethub.png" alt="Logo" class="logo-middle-img">
            </a>
            </div>
        <div class="title">
            <B>Notification</B>
        </div>
    </header>
    <br>
    <br>
    <div class="notification-container">
        <div class="notification-column">
            <h3>Product Notifications</h3>
            <?php echo $product_notifications; ?>
        </div>
        <div class="notification-column">
            <h3>Pet Adoption Notifications</h3>
            <?php echo $adopt_notifications; ?>
        </div>
        <div class="notification-column">
            <h3>Report Warnings</h3>
            <?php echo $report_notifications; ?>
        </div>
    </div>
</body>
</html>
