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

    private function endExecution(Exception $e)
    {
        echo $e->getMessage();
        exit(0);
    }

    public function fetch_all($query)
    {
		
    }

    public function query($query)
    {
		
    }

	private function closeConnection()
    {
          
		sasql_close( $this->connection );
		
    }
	
}
?>