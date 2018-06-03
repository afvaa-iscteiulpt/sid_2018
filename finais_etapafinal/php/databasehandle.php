<?php
ini_set('max_execution_time', '0');
ini_set('memory_limit', '800M');
date_default_timezone_set('Europe/Lisbon');

class databasehandle
{

    var $connection;

    public function __construct($connectionString)
    {
            $conn = sasql_connect( $connectionString );
            $this->connection = $conn;
			
    }

    public function query($query)
    {
		$array_result = array();
		$i = 0;
		$result = sasql_query( $this->connection, $query );
		  
		  if( ! $result ) {
			  echo "sasql_query failed!";
			  $this->endExecution();
		  } else {
			  
			  
			  
			while ($row = sasql_fetch_array($result)) {
				
				array_push($array_result, $row);
			
			}
			
		  }
		  
		  return $array_result;
    }

	private function closeConnection()
    {
          
		sasql_close( $this->connection );
		
    }
	public function endExecution()
    {
		$this->closeConnection();
		echo "Something failed!";
		exit(0);
        
    }
}
?>