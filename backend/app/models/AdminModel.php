<?php
require_once APPROOT . '/config/config.php';
class AdminModel
{
    protected $db;
    public function __construct()
    {
        $con = new Database();
        $this->db = $con->dbh;
    }

    public function selectAll()
    {
        $conn = $this->db;
        $requi = "SELECT * FROM `admin`";
        $stm = $conn->prepare($requi);
        $stm->execute();
        $result = $stm->fetchAll(PDO::FETCH_ASSOC);
        return $result;
    }

    public function remove($id)
    {
        $conn = $this->db;
        $requet = "DELETE FROM `client` WHERE id=" . $id;
        $stmn = $conn->prepare($requet);
        return $stmn->execute();
    }
    public function SelectOneUser($id)
    {
        $conn = $this->db;
        $requet = "SELECT * FROM `client` WHERE id=" . $id;
        $stmt = $conn->prepare($requet);
        $stmt->execute();
        $result = $stmt->fetch(PDO::FETCH_ASSOC);
        return $result;
    }
    public function updateUser($data)
    {
        $conn = $this->db;
        $query = $conn->prepare("UPDATE `client` SET
                                `fname`=?,
                                `lname`=?,
                                `tel`=?,
                                `profession`=?
                                WHERE id=?");
             $params = array($data["fname"],$data["lname"],$data["tel"],$data["profession"],$data["id"]);
             $stmnt = $query->execute($params);
        return $stmnt;
    }
}
