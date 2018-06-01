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
			
			 $this->startConnection();
			 
			  if( ! $this->dbconnection ) {
				  $this->endExecution(null);
			 } else {
					//run query on databasehandle object to get info
			 echo json_encode(array());
			}
		
		
		} else {
			echo "not a post, or missing parameters";
		}
	
    
	}
		
	
	private function startConnection() {
   
        $this->dbconnection = new databasehandle("uid=" . $this->username . ";pwd=" . $this->password);
        
    }
	
	private function endExecution(Exception $e)
    {
       
         $message = $e->getMessage();
         echo $message;
         exit(0);
        
    }
}
new getCultura();
?>

