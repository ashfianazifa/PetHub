<?php 

$sName = "localhost";
$uName = "root";
$pass = "";
$db_name = "auth_db";

try {
    $conn = new PDO("mysql:host=$sName;dbname=$db_name", $uName, $pass);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    if (session_status() === PHP_SESSION_NONE) {
        session_start();
    }

    if (isset($_GET["id"])) {
        $id = $_GET["id"];
        $user_id = $_SESSION['user_id'];
        $sql = "SELECT * FROM reportapro WHERE id = :id AND user_id = :user_id";
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(':id', $id, PDO::PARAM_INT);
        $stmt->bindParam(':user_id', $user_id, PDO::PARAM_INT);
        $stmt->execute();
        
        if ($stmt->rowCount() > 0) {

            echo json_encode(["success" => false]);
        } else {
            $insert = "INSERT INTO reportapro (id, user_id, reportnop, created_at) VALUES (:id, :user_id, 1, NOW())";
            $insert_stmt = $conn->prepare($insert);
            $insert_stmt->bindParam(':id', $id, PDO::PARAM_INT);
            $insert_stmt->bindParam(':user_id', $user_id, PDO::PARAM_INT);
            $insert_stmt->execute();
            $count_sql = "SELECT COUNT(*) AS total_reports FROM reportapro WHERE id = :id";
            $count_stmt = $conn->prepare($count_sql);
            $count_stmt->bindParam(':id', $id, PDO::PARAM_INT);
            $count_stmt->execute();
            $result = $count_stmt->fetch(PDO::FETCH_ASSOC);

            if ($result['total_reports'] > 2) {
                $delete_sql = "DELETE FROM prousers WHERE id = :id";
                $delete_stmt = $conn->prepare($delete_sql);
                $delete_stmt->bindParam(':id', $id, PDO::PARAM_INT);
                $delete_stmt->execute();

                $deleteGiveAdopt = $conn->prepare("DELETE FROM giveAdopt WHERE id = :user_id");
                $deleteGiveAdopt->bindParam(':user_id', $id, PDO::PARAM_INT);
                $deleteGiveAdopt->execute();

                $deleteProductSell = $conn->prepare("DELETE FROM productsell WHERE id = :user_id");
                $deleteProductSell->bindParam(':user_id', $id, PDO::PARAM_INT);
                $deleteProductSell->execute();

                $deleteCart = $conn->prepare("DELETE FROM cart WHERE user_id1 = :user_id");
                $deleteCart->bindParam(':user_id', $id, PDO::PARAM_INT);
                $deleteCart->execute();

                $deletePetCart = $conn->prepare("DELETE FROM petcart WHERE user_id1 = :user_id");
                $deletePetCart->bindParam(':user_id', $id, PDO::PARAM_INT);
                $deletePetCart->execute();

                $delete_reports_sql = "DELETE FROM reportapro WHERE id = :id";
                $delete_reports_stmt = $conn->prepare($delete_reports_sql);
                $delete_reports_stmt->bindParam(':id', $id, PDO::PARAM_INT);
                $delete_reports_stmt->execute();

                echo json_encode(["success" => true, "message" => "Reported"]);
            } else {
                echo json_encode(["success" => true, "message" => "Reported"]);
            }
        }
    }

} catch (PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}
?>
