
  <%--Infinite added for UC-PGM-CRM-018.10, CR 2401  --%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@taglib uri="http://www.acs-inc.com/custom" prefix="m"%>
<%@taglib uri="http://myfaces.apache.org/tomahawk" prefix="t"%>
<%@ taglib uri="http://java.sun.com/portlet" prefix="portlet"%>
<portlet:defineObjects />


<m:table width="100%" id="caseTypCrdBalTab1Id">
	<m:tr id="caseTypCrdBalTab1R1Id">

		<m:td id="caseTypCrdBalTab1R1C1Id">
			<m:div styleClass="padb" id="caseTypCrdBalDiv1Id">
				<h:outputLabel for="stateFiscYearend" id="caseTypCrdBalOutLbl1Id" 					value="#{msg['label.caseDetails.creditbalance.StateFiscalYearEnd']}" />
				<m:br id="caseTypCrdBalBr1Id"/>
				<m:inputCalendar id="stateFiscYearend" size="10"
					monthYearRowClass="yearMonthHeader" weekRowClass="weekHeader"
					currentDayCellClass="currentDayCell" renderAsPopup="true"
					addResources="true" readonly="false" popupDateFormat="MM/dd/yyyy"
					renderPopupButtonAsImage="true"
					value="#{logCaseDataBean.caseDetailsVO.caseTypeCreditBalanceVO.stateFiscYrEnd}"
					disabled="#{logCaseDataBean.disableScreenField}" />
			</m:div>
		</m:td>


	</m:tr>
</m:table>

