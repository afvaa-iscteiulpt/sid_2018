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
     
			if(isset($_POST['username']) && isset($_POST['password']))
		{
			
			$this->username = $_POST['username'];
			$this->password = $_POST['password'];
			
			$queryInput = "";
			if($this->username == "dba") {
				$queryInput = "SELECT * FROM AlertasHumidadeTemperatura WHERE dataHora " . $this->last2DaysQuery() . "' ORDER BY idAlerta DESC" ;
			} else {
				$queryInput = "SELECT * FROM DBA.AlertasPorInvestigador WHERE dataHora " . $this->last2DaysQuery() . "' ORDER BY idAlerta DESC" ;
			}
			
			//echo $queryInput;
			
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
	
	private function last2DaysQuery() {
			
		$todayBegin              = strtotime('00:00:00');
		$secndDate              = date("Y-m-d H:i:s", strtotime('23:59:59'));
		$firstDate          = strtotime('-1 day', $todayBegin);	
	
		return "BETWEEN '" . date("Y-m-d H:i:s", $firstDate) . "' AND '" . $secndDate;
	}
	
}
new getAlertas();
?>

