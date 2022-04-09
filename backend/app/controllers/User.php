<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin:*');
header('Access-Control-Allow-Methods:*');
class User extends Controller
{
  public $valide = "false";
  public function __construct()
  {
  }

  public function index()
  {
    $user = $this->model('UserModel');
    $users = $user->SelectAll();
    if ($_SERVER["REQUEST_METHOD"] === "POST") {
      $json = file_get_contents('php://input');
      // $data = json_decode($json);
      foreach ($users as $user) {
        if ($user['psseudo_client'] == $json) {
          $this->valide = $user;
          break;
        } else {
          $this->valide = false;
        }
      }
    }
    echo json_encode($this->valide);
    // echo "hslfhids";
  }

  public function register()
  {

    $model = $this->model('UserModel');
    if ($_SERVER["REQUEST_METHOD"] === "POST") {
      $json = file_get_contents('php://input');
      $data = json_decode($json);
      $data = array_values((array)$data);
      $data[4] = uniqid();
      $created = $model->insert($data);
      if ($created) {
        echo json_encode($data);
      }
      // header( "Location: http://localhost:8080/" );
    }
  }

  public function getAllRDV1()
  {
    // echo "hhhh";
    if ($_SERVER["REQUEST_METHOD"] === "GET") {
      // var_dump($_GET['id']);

      $RDV = $this->model('RDVModel');
      $RDVs = $RDV->selectAll1($_GET['id']);
      echo json_encode($RDVs);
    }
  }
  public function getAllRDV2()
  {
    // echo "hhhh";
    if ($_SERVER["REQUEST_METHOD"] === "GET") {
      // var_dump($_GET['id']);

      $RDV = $this->model('RDVModel');
      $RDVs = $RDV->selectAll2($_GET['id']);
      echo json_encode($RDVs);
    }
  }

  public function getUser()
  {
    $select = $this->model('UserModel');
    $selected = $select->select($_GET["id"]);
    echo json_encode($selected);
  }
  

  public function getOne()
  {
    $select = $this->model('UserModel');
    $selected = $select->selectAll();
    echo json_encode($selected);
  }

  public function addRDV()
  {
    if ($_SERVER["REQUEST_METHOD"] === "POST") {
      $addApp = $this->model('RDVModel');
      $json = file_get_contents('php://input');
      $data = json_decode($json);
      $data = array_values((array)$data);
      $addApp->insertRDV($data);
      // var_dump($data);
      echo json_encode($data);
      // if ($created) {
      //   echo json_encode($data);
      // }
    }
  }
  public function getcreDate()
  {
    $addApp = $this->model("RDVModel");
    $allcreneau = $addApp->getcreDate($_GET['date']);
    // var_dump($allcreneau);
    $datAA[0] = "10:00 - 10:30";
    $datAA[1] = "11:00 - 11:30";
    $datAA[2] = "14:00 - 14:30";
    $datAA[3] = "15:00 - 15:30";
    $datAA[4] = "16:00 - 16:30";
    foreach ($allcreneau as $creno) {
      if ($creno["id_creneau"] == "10:00 - 10:30") {
        unset($datAA[0]);
      }
      if ($creno["id_creneau"] == "11:00 - 11:30") {
        unset($datAA[1]);
      }
      if ($creno["id_creneau"] == "14:00 - 14:30") {
        unset($datAA[2]);
      }
      if ($creno["id_creneau"] == "15:00 - 15:30") {
        unset($datAA[3]);
      }
      if ($creno["id_creneau"] == "16:00 - 16:30") {
        unset($datAA[4]);
      }
    }
    echo json_encode($datAA);
  }
  public function deleterdv()
  {
    echo $_SERVER["REQUEST_METHOD"];
    if ($_SERVER["REQUEST_METHOD"] === "DELETE") {
      echo "hello";
      $this->id = json_decode(file_get_contents("php://input")) ->id;
      $user = $this->model('UserModel');
      $user->delete_r($this->id);
      // echo json_encode($id);
      // var_dump($id);
     
  }
}
}
