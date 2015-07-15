/*package com.xerox.enterprise.ghs.mmis.rif.rules.provider;

import com.acs.enterprise.mmis.provider.enrollment.common.delegate.ProviderEnrollmentDelegate;
import com.xerox.enterprise.ghs.mmis.rif.common.exception.RIFException;
import com.xerox.enterprise.ghs.mmis.rif.core.RulesContext;
import com.xerox.enterprise.ghs.mmis.rif.core.RulesResult;
import com.xerox.enterprise.ghs.mmis.rif.core.api.RulesManager;

import junit.framework.TestCase;

*//**
 * The class <code>PRV0330_0001_01Test</code> contains tests for the class
 * {@link <code>PRV0330_0001_01</code>}
 * 
 * @pattern JUnit Test Case
 * 
 * @generatedBy CodePro at 12/15/14 8:40 PM
 * 
 * @author 414774
 * 
 * @version $Revision$
 *//*
public class PRV0330_0001_01Test extends TestCase {

	*//**
	 * Construct new test instance
	 * 
	 * @param name
	 *            the test name
	 *//*
	public PRV0330_0001_01Test(String name) {
		super(name);
	}

	
	 * $CPS$ This comment was generated by CodePro. Do not edit it. patternId =
	 * com.instantiations.assist.eclipse.pattern.testCasePattern strategyId =
	 * com.instantiations.assist.eclipse.pattern.testCasePattern.junitTestCase
	 * additionalTestNames = assertTrue = false callTestMethod = true createMain
	 * = false createSetUp = false createTearDown = false createTestFixture =
	 * false createTestStubs = false methods = package =
	 * com.xerox.enterprise.ghs.mmis.rif.rules package.sourceFolder =
	 * RulesRIF/src/main/java superclassType = junit.framework.TestCase testCase
	 * = PRV0330_0001_01Test testClassType =
	 * com.xerox.enterprise.ghs.mmis.rif.rules.PRV0330_0001_01
	 

	public void testExecute() throws RIFException {

		// Rule Invocation Context object holds object arrays used in rule
		// execution.
		// Name of the rule to be executed.
		String ruleId = "PRV0330.0001.01";
		// boolean flag1=false;
		RulesContext ric = new RulesContext();
		// Adding object into rule invocation context.
		ProviderEnrollmentDelegate prEnrDel= new ProviderEnrollmentDelegate();
		//prEnrDel.
		String applicationNumber="123423";
		
		ric.addObject(applicationNumber);
		ric.addObject(prEnrDel);
		
		boolean result = false;

		RulesManager rulesManager = RulesManager.getRIFInstance();

		// Invoke RIF with rulename and rule invocation objects.
		RulesResult rulesResult = null;

		try {
			rulesResult = rulesManager.execute(ruleId, ric);
			result = rulesResult.isReturnBooleanValue();

		} catch (RIFException re) {
			re.printStackTrace();
		}
		//assertTrue();
	}
}
*/