/*package com.xerox.enterprise.ghs.mmis.rif.rules.operations;

import junit.framework.Test; 
import junit.framework.TestSuite; 
import junit.framework.TestCase; 

import java.util.ArrayList;
import java.util.List;
import com.xerox.enterprise.ghs.mmis.rif.core.RulesContext;
import com.xerox.enterprise.ghs.mmis.rif.core.api.RulesManager;
import com.xerox.enterprise.ghs.mmis.rif.common.exception.RIFException;

import com.xerox.enterprise.ghs.mmis.rif.core.RulesResult; 


*//** 
 * The class TPL0717_0001_01Test contains tests for the class
 * TPL0717_0001_01. 
 * 
 * @author 396662
 * @generatedBy RIF 
 * @since <pre>Thu Jan 08 12:14:49 IST 2015</pre> 
 * @version 1.0 
 *//* 
public class TPL0717_0001_01Test extends TestCase { 
    public TPL0717_0001_01Test(String name) { 
        super(name); 
    } 
 
    public void setUp() throws Exception { 
        super.setUp(); 
    } 
 
    public void tearDown() throws Exception { 
        super.tearDown(); 
    } 
    *//** 
     * Method Name: execute
     * Param: RulesContext ctx, String ruleId 
     * 
     *//* 
	 
    public void testEXECUTE() throws Exception { 
        //TODO: Test goes here... 
		
		//TODO: Assignment
		String recoveryReason = ""; 
					boolean result = false; 
					Double recoveryAmount = 0d; 
		
					  
		  
		
              System.out.println("Started Rule Execution::::");
              
              //Rule Invocation Context object holds object arrays used in rule execution.
			  			    String ruleId = "TPL0717.0001.01";
			    RulesContext ric = new RulesContext();
			    //Adding object into rule invocation context.
			 	ric.addObject(recoveryReason);
				ric.addObject(result);
				ric.addObject(recoveryAmount);
	    
			          		                  //Invoke RIF with ruleid and rule invocation objects.
			  			    RulesResult rulesResult = null;
			                
              try {
              		RulesManager rulesManager = RulesManager.getRIFInstance();
                     						rulesResult = rulesManager.execute(ruleId, ric);	
					  					  						result=rulesResult.isReturnBooleanValue(); 
					                } catch (RIFException re){
                     System.out.println("RIFException::::"+re);
              }
              System.out.println("Rule Execution Ended::::"+ruleId+"\n");

    	assertEquals(true,rulesResult.getRuleStatus());
    } 
 
 
 
    public static Test suite() { 
        return new TestSuite(TPL0717_0001_01Test.class); 
    } 
} */