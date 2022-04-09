<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin:*');
header('Access-Control-Allow-Methods:*');
if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_METHOD'])) header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
    if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS'])) header("Access-Control-Allow-Headers: {$_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']}");
}
if ($_SERVER["REQUEST_METHOD"] == "OPTIONS") return true;

class Admin extends Controller
{
    public $id;
    public $valide;
    public function __construct()
    {
    }

    public function index()
    {
        $admin = $this->model('AdminModel');

        $admins = $admin->selectAll();

        // users si la liste des user in database

        if ($_SERVER["REQUEST_METHOD"] === "POST") {
            $json = file_get_contents('php://input');
            // $data = json_decode($json);
            // $key = $data;
            foreach ($admins as $admin) {
                if ($admin['psseudo_admin'] == $json) {
                    $this->valide = $admin;
                    break;
                } else {
                    $this->valide = false;
                }
            }
            echo json_encode($this->valide);
            // echo json_encode($json);
        }
    }

    public function DELETEUSER()
    {
        if ($_SERVER["REQUEST_METHOD"] === "DELETE") {
            $this->id = $_GET['id'];
            $admin = $this->model('AdminModel');
            $admin->remove($this->id);
            // echo json_encode($id);
        }
    }
    
    public function deleteClient()
    {
        if ($_SERVER["REQUEST_METHOD"] === "DELETE") {
            $this->id = $_GET['id'];
            $admin = $this->model('AdminModel');
            $admin->remove($this->id);
            
            // echo json_encode($id);
        }
    }
    public function DELETERDV()
    {
        if ($_SERVER["REQUEST_METHOD"] === "GET") {
            $admin = $this->model('UserModel');
            $admin->remove($_GET['id']);
        }
    }

    public function getAllClient()
    {
        $admin = $this->model('UserModel');
        $admins = $admin->selectAll();
        echo json_encode($admins);
    }

    public function RDVALL($id)
    {
        $admin = $this->model('RDVModel');
        $admins = $admin->selectAll($id);
        echo json_encode($admins);
    }
    public function getAllRdv()
    {
        $admin = $this->model('RDVModel');
        $rdvs = $admin->selectAllRdv();
        // header("Content-Type: application/json");
        // var_dump($rdvs);
        echo json_encode($rdvs);
        die();
    }
    public function getOneUser()
    {
        if ($_SERVER["REQUEST_METHOD"] === "GET") {
            $id = $_GET['id'];
            $admin = $this->model('AdminModel');
            $data = $admin->SelectOneUser($id);
            echo json_encode($data);
        }
    }
    public function updateUser()
    {
      if ($_SERVER["REQUEST_METHOD"] === "POST") {
        $UpdateUser = $this->model('AdminModel');
        $json = file_get_contents('php://input');
        $data = json_decode($json, true);
        $Updatet = $UpdateUser->updateUser($data);
        echo json_encode($Updatet);
        // if ($created) {
        //   echo json_encode($created);
        // }
      }
    }
}
