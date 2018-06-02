<?php 
ini_set('max_execution_time', '0');
ini_set('memory_limit', '800M');
date_default_timezone_set('Europe/Lisbon');

define('ROOT', dirname(__FILE__) . "/");
include(ROOT . '/databasehandle.php');

class getAlertas
{
    public $dbconnection = null;
	private $username;
	private $password;
    
    public function __construct()
    {
     
	 $this->username = "DBA";
			$this->password = "sql";
			
			 $this->startConnection();
			 
			  if( ! $this->dbconnection ) {
				  $this->dbconnection->endExecution();
			 } else {
					$res = $this->dbconnection->query("SELECT * FROM AlertasHumidadeTemperatura ORDER BY idAlerta DESC");
					
					echo json_encode($res);
			}

/*	 
		if(isset($_POST['username']) && isset($_POST['password']))
		{
		
			$this->username = $_POST['username'];
			$this->password = $_POST['password'];
			
			 $this->startConnection();
			 
			  if( ! $this->dbconnection ) {
				  $this->dbconnection->endExecution();
			 } else {
					$res = $this->dbconnection->query("SELECT * FROM AlertasHumidadeTemperatura");
					
					echo json_encode($res);
			}
			
		
		} else {
			echo "not a post, or missing parameters";
		}
	*/
         
	}
		
	
	private function startConnection() {
   
       
        $this->dbconnection = new databasehandle("uid=" . $this->username . ";pwd=" . $this->password);
        
    }
	
}
new getAlertas();
?>

