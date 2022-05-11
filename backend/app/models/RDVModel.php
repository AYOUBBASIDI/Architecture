<?php
require_once APPROOT . '/config/config.php';
class RDVModel
{
    protected $db;
    public function __construct()
    {
        $con = new Database();
        $this->db = $con->dbh;
    }
    public function selectAllRdv()
    {
        $conn = $this->db;
        $requete = "select * from client INNER JOIN rdv ON client.id=rdv.id_client ";
        // $requete="select * from rdv";
        $stm = $conn->prepare($requete);
        $stm->execute();
        $result = $stm->fetchAll(PDO::FETCH_ASSOC);
        return $result;
    }
    public function selectAll1($id)
    {
        $conn = $this->db;
        $requete  = "SELECT * FROM rdv where id_client=$id and date_r>CURRENT_DATE() order by date_r  ASC;";
        // SELECT * FROM rdv,client where rdv.id_client=client.id and client.id=59 and date_r<CURRENT_DATE();
        $stm = $conn->prepare($requete);
        $stm->execute();
        $result = $stm->fetchAll(PDO::FETCH_ASSOC);
        return $result;
    }
    public function selectAll2($id)
    {
        $conn = $this->db;
        $requete  = "SELECT * FROM rdv where id_client=$id and date_r <= CURRENT_DATE() order by date_r  ASC;";
        // SELECT * FROM rdv,client where rdv.id_client=client.id and client.id=59 and date_r<CURRENT_DATE();
        $stm = $conn->prepare($requete);
        $stm->execute();
        $result = $stm->fetchAll(PDO::FETCH_ASSOC);
        return $result;
    }
    public function remove($id)
    {
        $conn = $this->db;
        $requete  = "DELETE FROM `rdv` WHERE id_r=$id";
        $stm = $conn->prepare($requete);
        $stm->execute();
    }

    public function getcreDate($data)
    {
        $conn = $this->db;
        $requi = "SELECT id_creneau FROM rdv WHERE date_r='$data'";
        $stm = $conn->prepare($requi);
        $stm->execute();
        $result = $stm->fetchAll(PDO::FETCH_ASSOC);
        return $result;
    }
    public function insertRDV($data)
    {
        $conn = $this->db;
        $requete  = "INSERT INTO `rdv`( `id_client`,`sujet`,`date_r`, id_creneau) VALUES (?,?,?,?)";
        $stm = $conn->prepare($requete);
        $result = $stm->execute($data);
        return $result;
    }
    public function updateRDV($data)
    {
        $conn = $this->db;
        $query = $conn->prepare("UPDATE `rdv` SET
                                `sujet`=?,
                                `date_r`=?,
                                `id_creneau`=?
                                WHERE id_r=?");
             $params = array($data["sujet"],$data["date"],$data["id_creneau"],$data["id_r"]);
             $stmnt = $query->execute($params);
        return $stmnt;
        // echo "hello";
    }
}
