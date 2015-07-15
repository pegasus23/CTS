package com.xerox.enterprise.ghs.mmis.rif.rules.operations;


import org.apache.log4j.Level;
import org.apache.log4j.Logger;

import java.util.HashSet;
import java.util.List;

import com.xerox.enterprise.ghs.mmis.rif.common.exception.RIFPOJORulesException;
import com.xerox.enterprise.ghs.mmis.rif.core.Rule;
import com.xerox.enterprise.ghs.mmis.rif.core.RulesContext;
import com.xerox.enterprise.ghs.mmis.rif.core.RulesResult;
import com.acs.enterprise.mmis.operations.tpladministration.application.exception.TPLRecoveryBusinessException;
import com.acs.enterprise.mmis.operations.tpladministration.common.vo.TPLRecoveryCaseMemberClaimSelectionVO;

import java.util.Set;

import com.acs.enterprise.mmis.operations.tpladministration.common.delegate.TPLRecoveryDelegate;


/**
 * POJO for the rule "TPL0810.0001.01"
 * @author $authorName
 * @source TPLRecoveryControllerBean
 */
public class TPL0810_0001_01 extends Rule {
	
    /* Static logger to log a message */
    private static final Logger LOG = Logger.getLogger(TPL0810_0001_01.class);
	
    /**
     * Execute method of the rule. This holds the rule conditions and actions.
     * The required objects are initialized through init() method.
     * return - execution result of rule either SUCCESS or FAILURE
     */
    public static RulesResult execute(RulesContext ctx, String ruleId) throws RIFPOJORulesException {
		
        // Construct rules result object
        RulesResult rulesResult = new RulesResult(ruleId);
        TPLRecoveryCaseMemberClaimSelectionVO tplRecoveryCaseMemberClaimSelectionVO = null;
        TPLRecoveryDelegate tplRecoveryDelegate = null;
        String caseID = null;
        String tcn = null;
        Set listOfLineItems = null;

        if (ctx != null) {
				
            List<Object> inputObjs = ctx.getContextObject();

            tplRecoveryCaseMemberClaimSelectionVO = (TPLRecoveryCaseMemberClaimSelectionVO) inputObjs.get(0);
            if (tplRecoveryCaseMemberClaimSelectionVO == null) {
                LOG.error("Input Object tplRecoveryCaseMemberClaimSelectionVO is  null during intialization for the rule " + ruleId);
                throw new RIFPOJORulesException("Unable to initialize the required rules objects for rule " + ruleId);
            }

            tplRecoveryDelegate = (TPLRecoveryDelegate) inputObjs.get(1);
            if (tplRecoveryDelegate == null) {
                LOG.error("Input Object tplRecoveryDelegate is  null during intialization for the rule " + ruleId);
                throw new RIFPOJORulesException("Unable to initialize the required rules objects for rule " + ruleId);
            }

            caseID = (String) inputObjs.get(2);
            if (caseID == null) {
                LOG.error("Input Object caseID is  null during intialization for the rule " + ruleId);
                throw new RIFPOJORulesException("Unable to initialize the required rules objects for rule " + ruleId);
            }

            tcn = (String) inputObjs.get(3);
            if (tcn == null) {
                LOG.error("Input Object tcn is  null during intialization for the rule " + ruleId);
                throw new RIFPOJORulesException("Unable to initialize the required rules objects for rule " + ruleId);
            }

            listOfLineItems = (Set) inputObjs.get(4);
            if (listOfLineItems == null) {
                LOG.error("Input Object listOfLineItems is  null during intialization for the rule " + ruleId);
                throw new RIFPOJORulesException("Unable to initialize the required rules objects for rule " + ruleId);
            }

        } else {
            if (LOG.isEnabledFor(Level.ERROR)) {
                LOG.error("Input Context Object is null during intialization for the rule " + ruleId);
            }
            throw new RIFPOJORulesException("Unable to initialize the required rules objects for rule " + ruleId);
        }
        if (LOG.isInfoEnabled()) {
            LOG.info("Executing the actions for the rule " + ruleId);
        }
        
        try {
				    
            if ("L".equalsIgnoreCase(tplRecoveryCaseMemberClaimSelectionVO.getPricingMethodCode())) {
                listOfLineItems = tplRecoveryDelegate.MMISPharmacyLineItemsFilter(tcn, tplRecoveryCaseMemberClaimSelectionVO.getSysId(),
                        tplRecoveryCaseMemberClaimSelectionVO.getClaimType(), caseID);
                rulesResult.setReturnValue(listOfLineItems);
            }
        } catch (TPLRecoveryBusinessException e) {
            e.printStackTrace();
        }
		
        rulesResult.setRuleStatus(true);
        return rulesResult;
		
    }
	
    /*
     * Method to initialize rule
     */
    public static void initialize() throws RIFPOJORulesException {// TODO Auto-generated method stub
    }

    /*
     * Method to shutdown rule
     */
    public static void shutdown() throws RIFPOJORulesException {// TODO Auto-generated method stub
    }
	
}
