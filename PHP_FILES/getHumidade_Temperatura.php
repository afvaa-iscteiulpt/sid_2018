<?php 
ini_set('max_execution_time', '0');
ini_set('memory_limit', '800M');
date_default_timezone_set('Europe/Lisbon');

define('ROOT', dirname(__FILE__) . "/");
include(ROOT . '/databasehandle.php');

class getHumidade_Temperatura
{
    public $dbconnection = null;
	private $username;
	private $password;
    private $datepickerDate;
	
	 public function __construct()
    {
		
			if(isset($_POST['username']) && isset($_POST['password']))
		{
			
			$this->username = $_POST['username'];
			$this->password = $_POST['password'];
			
			if(isset($_POST['datepickerDate'])) 
				$this->datepickerDate = $_POST['datepickerDate'];
					
			$query = "";
			if($this->username == "dba") {
				$query = "SELECT * FROM HumidadeTemperatura WHERE dataHoraMedicao " . $this->last2DaysQuery() . "' ORDER BY dataHoraMedicao" ;
			} else {
				//TODO - query à view
				$query = "SELECT * FROM HumidadeTemperatura WHERE dataHoraMedicao " . $this->last2DaysQuery() . "' ORDER BY dataHoraMedicao" ;
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
	
	private function last2DaysQuery() {
			
		$firstDate = "";
		$secndDate = "";
		if(!$this->datepickerDate != "" && $this->datepickerDate != null && isset($this->datepickerDate)) {
			
			$time = strtotime($this->datepickerDate);
			$secndDate = date('Y-m-d 23:59:59',$time);
			$firstDate = strtotime('-1 day', $time);	
		
		} else {
			$todayBegin              = strtotime('00:00:00');
			$secndDate              = strtotime('23:59:59');
			$firstDate          = strtotime('-1 day', $todayBegin);	
		}
			
		return "BETWEEN '" . date("Y-m-d H:i:s", $firstDate) . "' AND '" . date("Y-m-d H:i:s", $secndDate);
	}
	
}
new getHumidade_Temperatura();
?>

