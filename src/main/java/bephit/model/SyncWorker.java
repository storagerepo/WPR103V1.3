package bephit.model;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;


/**
 * A synchronous worker
 */
@Component("syncWorker")
public class SyncWorker implements Worker {

	protected static Logger logger = LoggerFactory.getLogger("service");

	public void work() {
		String threadName = Thread.currentThread().getName();
		logger.info("   " + threadName + " syncro has  began working.");
		System.out.println("Began working");
        try {
        	logger.info("working...");
        	System.out.println("working..");
            Thread.sleep(10000); // simulates work
        }
        catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
        logger.info("   " + threadName + " has completed work.");
        System.out.println("completed");
	}
	
}
