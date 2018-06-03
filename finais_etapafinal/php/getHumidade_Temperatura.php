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
					
				
			
			$queryInput = "SELECT * FROM DBA.HumidadeTemperatura WHERE dataHoraMedicao " . $this->last2DaysQuery() . "' ORDER BY dataHoraMedicao" ;
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
			
		$firstDate = "";
		$secndDate = "";
		if($this->datepickerDate != "" && $this->datepickerDate != null && isset($this->datepickerDate)) {
			
			$secndDate = $this->datepickerDate . ' 23:59:59';
			$firstDate = $this->datepickerDate . ' 00:00:00';
		
		} else {
			
			$secndDate              = date("Y-m-d H:i:s", strtotime('23:59:59'));
			$firstDate          = date("Y-m-d H:i:s", strtotime('00:00:00'));
		}
		
		return "BETWEEN '" . $firstDate . "' AND '" . $secndDate;
	}
	
}
new getHumidade_Temperatura();
?>

