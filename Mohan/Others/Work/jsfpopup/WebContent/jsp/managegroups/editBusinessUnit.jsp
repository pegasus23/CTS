<%--
  Portlet 8.0 Migration Activity: h:commandLink is not supported in portal 8.0, replacing with myfaces t:commandLink tag
  Portlet 8.0 Migration Activity: m:dataScroller is not supported in portal 8.0, replacing with myfaces t:dataScroller tag
--%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://myfaces.apache.org/tomahawk" prefix="t"%>
<%@ taglib uri="http://www.acs-inc.com/custom" prefix="m"%>
<%@ taglib uri="http://java.sun.com/portlet" prefix="portlet"%>
<%@ taglib uri="http://www.acs-inc.com/auditLog" prefix="audit"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="false"%>
<portlet:defineObjects />

<f:loadBundle
	basename="com.acs.enterprise.common.program.contactmanagement.view.nl.PGM_IN_ContactManageGroup"
	var="msg" />

<f:loadBundle
	basename="com.acs.enterprise.common.util.helper.nl.EnterpriseMessages"
	var="ent" />

<f:loadBundle
	basename="com.acs.enterprise.common.util.helper.nl.ProgramMessages"
	var="ref" />

<SCRIPT type="text/javascript">

	function editBUCancel(link)
{
	if (isFormChanged(frmId) == true)
	{
  		var answer = confirm("Unsaved changes will be lost.  Are you sure that you want to navigate?");				
		if(answer)
		{						
			var entObject = findObjectByPartOfID(link);
			entObject.click();
		}
	}
	else
	{
		var entObject = findObjectByPartOfID(link);
		entObject.click();
	}
}
function findObjectByPartOfID(partOfID)
{
	for(i=0; i<document.forms.length; i++)
	{
		for(j=0; j<document.forms[i].elements.length; j++)
		{
			var idValue = document.forms[i].elements[j].id;
			if(idValue.indexOf(partOfID)!=-1)
			{
				G_isFirstTime = false;
				G_countObject = document.forms[i].elements[j];
				return document.forms[i].elements[j];
			}
		}
	}		
	return null;
}	
		/*Small save Big Save start*/
		frmId = 'view<portlet:namespace/>:EditBusinessUnit';
		/*Small save Big Save ends*/
		
		var sliderState='closed';
		function doSlider(formID){
			var el = document.getElementById('view<portlet:namespace/>:'+formID+':'+"main_pod");
			var slide=document.getElementById('view<portlet:namespace/>:'+formID+':'+"slider");
			var treePod=document.getElementById('view<portlet:namespace/>:'+formID+':'+"navigator_pod");
			var status=document.getElementById('view<portlet:namespace/>:'+formID+':'+"sliderStatus");
			if (sliderState == 'open'){
			  treePod.style.display = '';
			  el.style.width = "73%";
			  sliderState = 'closed';
			  status.value = 'open';
			  slide.innerHTML = '&lt;'
			}
			else{
			  treePod.style.display = 'none';
			  el.style.width = "97%";
			  sliderState = 'open';
			  status.value = 'closed';
			  slide.innerHTML = '&gt;'
			}
		}
		
		function showHide(){
			var el = document.getElementById('view<portlet:namespace/>:EditBusinessUnit:'+"main_pod");
			var slide=document.getElementById('view<portlet:namespace/>:EditBusinessUnit:'+"slider");
			var treePod=document.getElementById('view<portlet:namespace/>:EditBusinessUnit:'+"navigator_pod");
			var status=document.getElementById('view<portlet:namespace/>:EditBusinessUnit:'+"sliderStatus").value;
			if (status == 'open'){
			  treePod.style.display = '';
			  el.style.width = "73%";
			  slide.innerHTML = '&lt;'
			}
			else{
			  treePod.style.display = 'none';
			  el.style.width = "97%";
			  slide.innerHTML = '&gt;'
			}
		}
				
		/** This method confirms the Delete Operation */    
	   function confirmDeleteBU(formID, id) 
	   { 	
	   	   
           var box = confirm("Are you sure that you want to Delete?");
           if(box == true){
               document.getElementById('view<portlet:namespace/>:'+formID+':'+id).click();                         
           }          
       } 
	   
	   function renderAudit(id1) 
	   { 
			var hiddenValueCI = document.getElementById('view<portlet:namespace/>:EditBusinessUnit:lobAuditLog:'+id1);
			if ((hiddenValueCI == null) ||(hiddenValueCI == '')|| (hiddenValueCI.length == 0)){
				hideMe('audit_plus');
			} 
			else if ((hiddenValueCI.value == 'false')){
				hideMe('audit_plus');
		    } 
	   }
	   function doEditBussinessUnitClickAction(link)
		{						
			var answer = confirm("Are you sure you want to navigate away from page?");				
			if(answer)
			{
				link.fireEvent('onclick');
			}
		}
	</SCRIPT>

<f:view>
	<%-- Small save Big Save start --%>
	<f:subview id="businessUnitService">
		<jsp:include page="/jsp/commonEntities/commonScripts.jsp" />
	</f:subview>
	<%-- Small save Big Save ends --%>

	<body onload="renderAudit('audit_open');">

	<h:inputHidden id="controlRequiredForEditBusinessunit"
		value="#{lobHierarchyControlBean.controlRequired}"></h:inputHidden>

	<h:inputHidden id="loadUserPermission"
		value="#{lobHierarchyControlBean.loadUserPermission}"></h:inputHidden>
	<h:form id="EditBusinessUnit">
		<h:inputHidden id="sliderStatus"
			value="#{lobHierarchyDataBean.sliderStatus}"></h:inputHidden>
		<m:div styleClass="infoTitle" align="left">
			<m:span styleClass="required">
				<h:outputText id="PRGCMGTOT1560" value="#{ent['label-sw-reqFld']}"
					styleClass="errorMessage" />
			</m:span>
		</m:div>
		<m:div styleClass="infoActions">
			<t:commandLink id="auditLog"
				action="#{lobHierarchyControlBean.doAuditKeyListOperationForBU}"
				onmousedown="if(event.button==1) flagWarn=false; " value="Audit Log"
				style="font-weight: bold;"></t:commandLink>
		</m:div>
		<m:div>
			<m:table id="PROVIDERMMT20120731164811622" width="100%">
				<m:tr>
					<m:td id="navigator_pod" styleClass="navigator_pod">
						<m:div align="left">
							<f:subview id="bpTree">
								<jsp:include page="/jsp/managegroups/lobHierachy.jsp" />
							</f:subview>
						</m:div>
					</m:td>
					<m:td id="slider" align="center" styleClass="slider"
						onmousedown="doSlider('EditBusinessUnit')"
						title="#{msg['label.lob.slider']}">
						<f:verbatim>
							<h:outputText id="shift" value="#{msg['label.lob.lshift']}" />
						</f:verbatim>
					</m:td>
					<m:div styleClass="msgBox"
						rendered="#{lobHierarchyDataBean.showDeletedMessage}">
						<h:outputText id="PRGCMGTOT1561"
							value="#{msg['err.businessUnit.delete']}" />
					</m:div>

					<m:td styleClass="sliderSpace"></m:td>
					<m:td id="main_pod" styleClass="main_pod">
						<m:div id="editBuss" rendered="#{lobHierarchyDataBean.flag}">
							<m:section id="PROVIDERMMS20120731164811623" styleClass="otherbg">
								<m:legend>
									<f:verbatim>
										<h:outputText id="PRGCMGTOT1562" styleClass="strong"
											value="#{msg['title.label.managegroups.editBusinessunit']}" />
									</f:verbatim>
								</m:legend>
								<m:div styleClass="infoActions">
									<h:commandButton id="ebcan"
										action="#{lobHierarchyControlBean.cancelEditUnit}"
										style="COLOR:#00f;BACKGROUND-COLOR:transparent;CURSOR:hand;FONT-SIZE:12px;WIDTH:45px;BORDER:0;text-align:left;font-family: Verdana; font-size: 10px;clip: rect(auto, auto, 0px, auto);  vertical-align: top;word-spacing: normal;position:relative;top:-25px"
										value="#{msg['label.lob.cancelbutton']}"></h:commandButton>





								</m:div>
								<m:div styleClass="infoActions">
									<h:outputText id="PRGCMGTOT1563" escape="false"
										style="COLOR:#00f;BACKGROUND-COLOR:transparent;CURSOR:hand;FONT-SIZE:12px;WIDTH:10px;BORDER:0;text-align:left;font-family: Verdana; font-size: 10px;clip: rect(auto, auto, 0px, auto);  vertical-align: top;word-spacing: normal;position:relative;top:-25px"
										value="|" />
								</m:div>
								
								<%-- code modified for defect:ESPRD00811290 to stop the action onclick of delete popup cancel button--%>
								<m:div styleClass="infoActions">
									<h:commandButton id="bdel"
										onmousedown="if(event.button==1) flagWarn=false;"
										action="#{lobHierarchyControlBean.deleteBusinessUnit}"
										value="#{ent['label-sw-delete']}"
										style="COLOR:#00f;BACKGROUND-COLOR:transparent;CURSOR:hand;FONT-SIZE:12px;WIDTH:42px;BORDER:0;text-align:left;font-family: Verdana; font-size: 10px;clip: rect(auto, auto, 0px, auto);  vertical-align: top;word-spacing: normal;position:relative;top:-25px"
										disabled="#{!lobHierarchyControlBean.controlRequired }"
										onclick="if (!confirm('Are you sure that you want to Delete?')) return(false);" />

								</m:div>
								<m:div styleClass="infoActions">
									<h:outputText id="PRGCMGTOT1564" escape="false"
										style="COLOR:#00f;BACKGROUND-COLOR:transparent;CURSOR:hand;FONT-SIZE:12px;WIDTH:10px;BORDER:0;text-align:left;font-family: Verdana; font-size: 10px;clip: rect(auto, auto, 0px, auto);  vertical-align: top;word-spacing: normal;position:relative;top:-25px"
										value="|" />
								</m:div>
								<m:div styleClass="infoActions">
									<%--<h:commandLink id="depadd"										onmousedown="if(event.button==1) flagWarn=false;"										action="#{lobHierarchyControlBean.addDepartPage}">
										<h:outputText id="PRGCMGTOT1565" value="#{msg['label.lob.addDepartment']}" />
									</h:commandLink>--%>
									<h:commandButton id="depadd"
										onmousedown="if(event.button==1) flagWarn=false;"
										style="COLOR:#00f;BACKGROUND-COLOR:transparent;CURSOR:hand;FONT-SIZE:12px;WIDTH:87px;BORDER:0;text-align:left;font-family: Verdana; font-size: 10px;clip: rect(auto, auto, 0px, auto);  vertical-align: top;word-spacing: normal;position:relative;top:-25px"
										disabled="#{!lobHierarchyControlBean.controlRequired}"
										value="#{msg['label.lob.addDepartment']}"
										action="#{lobHierarchyControlBean.addDepartPage}" />
								</m:div>
								<m:div styleClass="infoActions">
									<h:outputText id="PRGCMGTOT1566" escape="false"
										style="COLOR:#00f;BACKGROUND-COLOR:transparent;CURSOR:hand;FONT-SIZE:12px;WIDTH:10px;BORDER:0;text-align:left;font-family: Verdana; font-size: 10px;clip: rect(auto, auto, 0px, auto);  vertical-align: top;word-spacing: normal;position:relative;top:-25px"
										value="|" />
								</m:div>
								<m:div styleClass="infoActions">
									<%--<h:commandLink id="bupd"										onmousedown="if(event.button==1) flagWarn=false;"										action="#{lobHierarchyControlBean.updateBusinessUnit}">
										<h:outputText id="PRGCMGTOT1567" value="#{msg['label.lob.savebutton']}" />
									</h:commandLink>--%>

									<h:commandButton id="bupd"
										onmousedown="if(event.button==1) flagWarn=false;"
										style="COLOR:#00f;BACKGROUND-COLOR:transparent;CURSOR:hand;font-weight:bold;FONT-SIZE:12px;WIDTH:33px;BORDER:0;text-align:left;font-family: Verdana; font-size: 10px;clip: rect(auto, auto, 0px, auto);  vertical-align: top;word-spacing: normal;position:relative;top:-25px"
										disabled="#{!lobHierarchyControlBean.controlRequired}"
										value="#{msg['label.lob.savebutton']}"
										action="#{lobHierarchyControlBean.updateBusinessUnit}" />
								</m:div>


								<m:div styleClass="msgBox"
									rendered="#{lobHierarchyDataBean.showSucessMessage}">
									<h:outputText id="PRGCMGTOT1568"
										value="#{ent['label-sw-success']}" />
								</m:div>
								<h:messages id="PRGCMGTMS26" showDetail="true"
									showSummary="false" styleClass="errorMessage" layout="table" />
								<m:table id="PROVIDERMMT20120731164811624" styleClass="dataTable" width="100%">

									<m:tr>
										<m:td>
											<m:span styleClass="required">
												<h:outputText id="PRGCMGTOT1569"
													value="#{ref['label.ref.reqSymbol']}" />
											</m:span>
											<%--Code Modified for the defect ESPRD00722464 on 01/19/2012-Start --%>
											
											<h:outputLabel id="LobHierarchyName2" for="name2"
												value="#{msg['label.lob.descName']}" />
											<m:br></m:br>
											<h:inputText id="name2"
												value="#{lobHierarchyDataBean.lobHieracVO.lobHieracParentVO.lobDesc}" />
											<m:br></m:br>
											<h:message id="PRGCMGTM220" for="LobHierarchyName2"
												showDetail="true" styleClass="errorMessage" />
												
											<%--Code Modified for the defect ESPRD00722464 on 01/19/2012-End --%>
												
										</m:td>
									</m:tr>
								</m:table>
							</m:section>
						</m:div>
						<%--  Audit Log --%>
						<m:table id="PROVIDERMMT20120731164811625" width="100%">
							<m:tr>
								<m:td>
									<m:div rendered="#{lobHierarchyDataBean.showAuditLogPage}">
										<%--<f:subview id="lobAuditLog">
											<jsp:include page="/jsp/managegroups/inc_editLobAuditLog.jsp" />
										</f:subview>--%>
										<f:subview id="CategoryAuditInc">
											<m:div rendered="#{lobHierarchyDataBean.auditLogFlagBU}">
												<audit:auditTableSet id="CategoryAuditId"
													value="#{lobHierarchyDataBean.lobHieracVO.auditKeyList}"
													numOfRecPerPage="10"></audit:auditTableSet>
											</m:div>
										</f:subview>
									</m:div>
								</m:td>
							</m:tr>
						</m:table>
					</m:td>
				</m:tr>
			</m:table>
		</m:div>

		<t:saveState id="CMGTTOMSS474" value="#{lobHierarchyDataBean.flag}"></t:saveState>
		<t:saveState id="CMGTTOMSS475" value="#{lobHierarchyDataBean.idName}"></t:saveState>
		<t:saveState id="CMGTTOMSS476"
			value="#{lobHierarchyDataBean.showSucessMessage}"></t:saveState>
		<t:saveState id="CMGTTOMSS477"
			value="#{lobHierarchyDataBean.sliderStatus}"></t:saveState>
	</h:form>
	<%-- var thisForm : stores the form reference. Form reference is use to get  the computed  role stored in hidden form field.
         FlagRole : Indicator to store role information .Stores 'False' for inquire only users and 'True' for other user.
	--%>
	<script type="text/JavaScript">

   var thisForm = 'view<portlet:namespace/>:EditBusinessUnit';

   flagRole =((typeof (document.getElementById(thisForm+': controlRequiredForEditBusinessunit) !=  'undefined')) && document.getElementById(thisForm+':controlRequiredForEditBusinessunit) != null ?  document.getElementById(thisForm+':controlRequiredForEditBusinessunit).value:true);

</script>
	</body>
	<f:verbatim>
		<SCRIPT type="text/javascript">
		showHide();
		</SCRIPT>
	</f:verbatim>
</f:view>

