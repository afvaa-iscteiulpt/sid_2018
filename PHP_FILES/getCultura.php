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
    
	 public function __construct()
    {
		
			if(isset($_POST['username']) && isset($_POST['password']))
		{
			
			$this->username = $_POST['username'];
			$this->password = $_POST['password'];
			
			$query = "";
			if($this->username == "dba") {
				$query = "SELECT * FROM Cultura";
			} else {
				$query = "SELECT * FROM CulturaPorInvestigador";
			}
		
			 $this->startConnection();
			 
			  if( ! $this->dbconnection ) {
				  $this->dbconnection->endExecution();
			 } else {
				$res = $this->dbconnection->query($query);
					
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

