delimiter |

CREATE EVENT test
    ON SCHEDULE
      EVERY 5 SECOND
    DO
      BEGIN
    
    
        INSERT INTO loginvestigador (email, nomeInvestigador) VALUES ("eventtest@event.com", "EVENTTEST");
		
    
    END |

delimiter ;