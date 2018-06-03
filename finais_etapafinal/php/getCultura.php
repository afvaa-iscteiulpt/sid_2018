<?php 
ini_set('max_execution_time', '0');
ini_set('memory_limit', '800M');
date_default_timezone_set('Europe/Lisbon');

define('ROOT', dirname(__FILE__) . "/");
include(ROOT . '/databasehandle.php');

class getCultura
{
    public $dbconnection = null;
	private $username;
	private $password;
	private $idCultura;
    
	 public function __construct()
    {
		
			if(isset($_POST['username']) && isset($_POST['password']))
		{
			
			$this->username = $_POST['username'];
			$this->password = $_POST['password'];
			
			if(isset($_POST['idCultura'])) {
				$this->idCultura = $_POST['idCultura'];
			
				$queryInput = "";
				if($this->username == "dba") {
					$queryInput = "SELECT * FROM Cultura WHERE idCultura > " . $this->idCultura;
				} else {
					$queryInput = "SELECT * FROM DBA.CulturaPorInvestigador WHERE idCultura > " . $this->idCultura;
				}

			} else {
				$queryInput = "";
				if($this->username == "dba") {
					$queryInput = "SELECT * FROM Cultura";
				} else {
					$queryInput = "SELECT * FROM DBA.CulturaPorInvestigador";
				}
			}
			
			 $this->startConnection();
			 
			  if( ! $this->dbconnection ) {
				  $this->dbconnection->endExecution();
			 } else {
				$res = $this->dbconnection->query($queryInput);
					
				echo json_encode($res);
			}
			
		
		} else {
			echo "not a post, or missing parameters";
		}
    
	}
	
	private function startConnection() {
   
        $this->dbconnection = new databasehandle("uid=" . $this->username . ";pwd=" . $this->password);
        
    }

}
new getCultura();
?>

