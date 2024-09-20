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

    if (isset($_GET["user_id"])) {
        $user_id = $_GET["user_id"];
        $id = $_SESSION['id'];

        $sql = "SELECT * FROM reportarec WHERE user_id = :user_id AND id = :id";
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(':user_id', $user_id, PDO::PARAM_INT);
        $stmt->bindParam(':id', $id, PDO::PARAM_INT);
        $stmt->execute();

        if ($stmt->rowCount() > 0) {
            echo json_encode(["success" => false, "message" => "Already reported"]);
        } else {
            $insert = "INSERT INTO reportarec (user_id, id, reportnor) VALUES (:user_id, :id, 1)";
            $insert_stmt = $conn->prepare($insert);
            $insert_stmt->bindParam(':user_id', $user_id, PDO::PARAM_INT);
            $insert_stmt->bindParam(':id', $id, PDO::PARAM_INT);
            $insert_stmt->execute();

            $count_sql = "SELECT COUNT(*) AS total_reports FROM reportarec WHERE user_id = :user_id";
            $count_stmt = $conn->prepare($count_sql);
            $count_stmt->bindParam(':user_id', $user_id, PDO::PARAM_INT);
            $count_stmt->execute();
            $result = $count_stmt->fetch(PDO::FETCH_ASSOC);

            if ($result['total_reports'] > 2) {
                $delete_sql = "DELETE FROM recusers WHERE user_id = :user_id";
                $delete_stmt = $conn->prepare($delete_sql);
                $delete_stmt->bindParam(':user_id', $user_id, PDO::PARAM_INT);
                $delete_stmt->execute();

                $deleteCart = $conn->prepare("DELETE FROM cart WHERE user_id1 = :user_id");
                $deleteCart->bindParam(':user_id', $user_id, PDO::PARAM_INT);
                $deleteCart->execute();

                $deletePetCart = $conn->prepare("DELETE FROM petcart WHERE user_id1 = :user_id");
                $deletePetCart->bindParam(':user_id', $user_id, PDO::PARAM_INT);
                $deletePetCart->execute();

                $delete_reports_sql = "DELETE FROM reportarec WHERE user_id = :user_id";
                $delete_reports_stmt = $conn->prepare($delete_reports_sql);
                $delete_reports_stmt->bindParam(':user_id', $user_id, PDO::PARAM_INT);
                $delete_reports_stmt->execute();

                echo json_encode(["success" => true, "message" => "User has been reported and deleted"]); // User deleted
            } else {
                echo json_encode(["success" => true, "message" => "User reported successfully"]); // Just reported
            }
        }
    }

} catch (PDOException $e) {
    echo json_encode(["success" => false, "error" => $e->getMessage()]);
}
?>
