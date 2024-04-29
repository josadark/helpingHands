UPDATE reporting.report_templates
SET "name"='Survey', description='Agent Satisfaction Reporting for Outbound Survey', jrxml='<?xml version="1.0" encoding="UTF-8"?>
<!-- Created with Jaspersoft Studio version 6.20.6.final using JasperReports Library version 6.20.6-5c96b6aa8a39ac1dc6b6bea4b81168e16dd39231  -->
<jasperReport xmlns="http://jasperreports.sourceforge.net/jasperreports" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://jasperreports.sourceforge.net/jasperreports http://jasperreports.sourceforge.net/xsd/jasperreport.xsd" name="Survey" pageWidth="900" pageHeight="612" orientation="Landscape" whenNoDataType="NoDataSection" columnWidth="860" leftMargin="20" rightMargin="20" topMargin="20" bottomMargin="20" uuid="0009c862-0249-47d0-8af6-f1b3325c447c">
	<property name="com.jaspersoft.studio.data.defaultdataadapter" value="Sample DB"/>
	<property name="com.jaspersoft.studio.unit." value="pixel"/>
	<property name="com.jaspersoft.studio.unit.pageHeight" value="pixel"/>
	<property name="com.jaspersoft.studio.unit.pageWidth" value="pixel"/>
	<property name="com.jaspersoft.studio.unit.topMargin" value="pixel"/>
	<property name="com.jaspersoft.studio.unit.bottomMargin" value="pixel"/>
	<property name="com.jaspersoft.studio.unit.leftMargin" value="pixel"/>
	<property name="com.jaspersoft.studio.unit.rightMargin" value="pixel"/>
	<property name="com.jaspersoft.studio.unit.columnWidth" value="pixel"/>
	<property name="com.jaspersoft.studio.unit.columnSpacing" value="pixel"/>
	<property name="net.sf.jasperreports.chart.pie.ignore.duplicated.key" value="true"/>
	<property name="com.jaspersoft.studio.data.sql.tables" value=""/>
	<style name="Top2" mode="Transparent" backcolor="#FFFFFF" pattern="">
		<conditionalStyle>
			<conditionExpression><![CDATA[1==1]]></conditionExpression>
			<style mode="Transparent" forecolor="#8FA3FF"/>
		</conditionalStyle>
	</style>
	<subDataset name="Dataset1" uuid="0f8901ea-effb-497e-b44c-c7cc3b89bc41">
		<property name="com.jaspersoft.studio.data.sql.tables" value=""/>
		<property name="com.jaspersoft.studio.data.defaultdataadapter" value="FILProduction.jrdax"/>
		<queryString language="SQL">
			<![CDATA[select inbound_calls.start_date, inbound_calls.call_id as inbound_call_id, inbound_calls.surveyaccepted,flow_result_details.answer, flow_result_details.question_id,flow_result_details.answer_token,flow_results.*, inbound_calls.agent from inbound_calls
LEFT JOIN flow_results on inbound_calls.call_id = flow_results.request_id  or inbound_calls.call_id = flow_results.call_id
LEFT JOIN flow_result_details on flow_results.call_id = flow_result_details.call_id 
where inbound_calls.start_date > timezone(''UTC'', now()) - ''1 day''
order by inbound_calls.agent]]>
		</queryString>
		<group name="Group1"/>
	</subDataset>
	<parameter name="SubTitle" class="java.lang.String">
		<defaultValueExpression><![CDATA[""]]></defaultValueExpression>
	</parameter>
	<parameter name="where" class="java.lang.String">
		<parameterDescription><![CDATA[]]></parameterDescription>
		<defaultValueExpression><![CDATA["inbound_calls.start_date > timezone(''UTC'', now()) - interval ''1 week''"]]></defaultValueExpression>
	</parameter>
	<parameter name="REPORT_MGR_BASE" class="java.lang.String" isForPrompting="false" evaluationTime="Late">
		<parameterDescription><![CDATA[Base URL for Report Manager]]></parameterDescription>
		<defaultValueExpression><![CDATA["http://localhost:8080/ReportMgr"]]></defaultValueExpression>
	</parameter>
	<parameter name="WEB_APP_DIR" class="java.lang.String">
		<parameterDescription><![CDATA["putdirhere"]]></parameterDescription>
	</parameter>
	<parameter name="agent_ID" class="java.lang.String">
		<defaultValueExpression><![CDATA[$P{agent_ID}]]></defaultValueExpression>
	</parameter>
	<queryString>
		<![CDATA[select inbound_calls.start_date, inbound_calls.call_id as inbound_call_id, inbound_calls.surveyaccepted,flow_result_details.answer, flow_result_details.question_id,flow_result_details.answer_token,flow_results.*, inbound_calls.agent from inbound_calls 
LEFT JOIN flow_results on inbound_calls.call_id = flow_results.request_id  or inbound_calls.call_id = flow_results.call_id
LEFT JOIN flow_result_details on flow_results.call_id = flow_result_details.call_id 
where $P!{where}
order by inbound_calls.agent]]>
	</queryString>
	<field name="start_date" class="java.sql.Timestamp"/>
	<field name="inbound_call_id" class="java.lang.String"/>
	<field name="surveyaccepted" class="java.lang.Boolean"/>
	<field name="answer" class="java.lang.String"/>
	<field name="question_id" class="java.lang.String"/>
	<field name="answer_token" class="java.lang.String"/>
	<field name="call_id" class="java.lang.String"/>
	<field name="flow_id" class="java.lang.String"/>
	<field name="request_id" class="java.lang.String"/>
	<field name="dnis" class="java.lang.String"/>
	<field name="ani" class="java.lang.String"/>
	<field name="session_id" class="java.lang.String"/>
	<field name="COLUMN_13" class="java.sql.Timestamp"/>
	<field name="end_date" class="java.sql.Timestamp"/>
	<field name="completed" class="java.lang.Boolean"/>
	<field name="end_reason" class="java.lang.String"/>
	<field name="call_classification" class="java.lang.String"/>
	<field name="agent" class="java.lang.String"/>
	<variable name="Accepted" class="java.lang.Integer" resetType="Group" resetGroup="Group2" incrementType="Group" incrementGroup="paginationByAgent_Qualifier" calculation="Sum">
		<variableExpression><![CDATA[$F{surveyaccepted}?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="TotalDeclined" class="java.lang.Integer" resetType="Group" resetGroup="Group2" incrementType="Group" incrementGroup="paginationByAgent_Qualifier" calculation="Sum">
		<variableExpression><![CDATA[$F{surveyaccepted}?0:1]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="TotalOffered" class="java.lang.Integer" resetType="Group" resetGroup="Group2">
		<variableExpression><![CDATA[$V{TotalDeclined}+$V{Accepted}]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question1_response1" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q1v2") || $F{question_id}.equals("ssfcuag_sp_q1")) && $F{answer}.equals("1")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question1_response2" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q1v2") || $F{question_id}.equals("ssfcuag_sp_q1")) && $F{answer}.equals("2")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question1_response3" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q1v2") || $F{question_id}.equals("ssfcuag_sp_q1")) && $F{answer}.equals("3")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question1_response4" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q1v2") || $F{question_id}.equals("ssfcuag_sp_q1")) && $F{answer}.equals("4")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question1_response5" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q1v2") || $F{question_id}.equals("ssfcuag_sp_q1")) && $F{answer}.equals("5")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question2_response1" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q2v2") || $F{question_id}.equals("ssfcuag_sp_q2")) && $F{answer}.equals("1")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question2_response2" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q2v2") || $F{question_id}.equals("ssfcuag_sp_q2")) && $F{answer}.equals("2")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question2_response3" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q2v2") || $F{question_id}.equals("ssfcuag_sp_q2")) && $F{answer}.equals("3")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question2_response4" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q2v2") || $F{question_id}.equals("ssfcuag_sp_q2")) && $F{answer}.equals("4")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question2_response5" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q2v2") || $F{question_id}.equals("ssfcuag_sp_q2")) && $F{answer}.equals("5")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question3_response1" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q3v2") || $F{question_id}.equals("ssfcuag_sp_q3")) && $F{answer}.equals("1")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question3_response2" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q3v2") || $F{question_id}.equals("ssfcuag_sp_q3")) && $F{answer}.equals("2")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question3_response3" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q3v2") || $F{question_id}.equals("ssfcuag_sp_q3")) && $F{answer}.equals("3")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question3_response4" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q3v2") || $F{question_id}.equals("ssfcuag_sp_q3")) && $F{answer}.equals("4")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question3_response5" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q3v2") || $F{question_id}.equals("ssfcuag_sp_q3")) && $F{answer}.equals("5")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question4_response1" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q4v2") || $F{question_id}.equals("ssfcuag_sp_q4")) && $F{answer}.equals("1")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question4_response2" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q4v2") || $F{question_id}.equals("ssfcuag_sp_q4")) && $F{answer}.equals("2")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question4_response3" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q4v2") || $F{question_id}.equals("ssfcuag_sp_q4")) && $F{answer}.equals("3")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question4_response4" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q4v2") || $F{question_id}.equals("ssfcuag_sp_q4")) && $F{answer}.equals("4")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question4_response5" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q4v2") || $F{question_id}.equals("ssfcuag_sp_q4")) && $F{answer}.equals("5")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Answer" class="java.lang.String" resetType="Group" resetGroup="Group2">
		<variableExpression><![CDATA[$F{answer}==null?"":$F{answer}]]></variableExpression>
	</variable>
	<variable name="response1" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[$F{question_id}.equals("ge_agent_sat_q1v2") && $F{answer}.equals("1")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="response2" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[$F{question_id}.equals("ge_agent_sat_q1v2") && $F{answer}.equals("2")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="response3" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[$F{question_id}.equals("ge_agent_sat_q1v2") && $F{answer}.equals("3")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="response4" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[$F{question_id}.equals("ge_agent_sat_q1v2") && $F{answer}.equals("4")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="response5" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[$F{question_id}.equals("ge_agent_sat_q1v2") && $F{answer}.equals("5")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="noresponse" class="java.lang.Integer" resetType="Group" resetGroup="Group2"/>
	<variable name="Question1Count" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q1v2") ?1:0)]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question2Count" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q2v2") ?1:0)]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question3Count" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q3v2")  ?1:0)]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question4Count" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q4v2") ?1:0)]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question1_noResponse" class="java.lang.Integer" resetType="Group" resetGroup="Group2">
		<variableExpression><![CDATA[$V{Question1Count}-($V{Question1_response1}+$V{Question1_response2}+$V{Question1_response3}+$V{Question1_response4}+$V{Question1_response5})]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question2_noResponse" class="java.lang.Integer" resetType="Group" resetGroup="Group2">
		<variableExpression><![CDATA[$V{Question1Count}-($V{Question1_response1}+$V{Question1_response2}+$V{Question1_response3}+$V{Question1_response4}+$V{Question1_response5})]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question3_noResponse" class="java.lang.Integer" resetType="Group" resetGroup="Group2">
		<variableExpression><![CDATA[$V{Question3Count}-($V{Question3_response1}+$V{Question3_response2}+$V{Question3_response3}+$V{Question3_response4}+$V{Question3_response5})]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question4_noResponse" class="java.lang.Integer" resetType="Group" resetGroup="Group2">
		<variableExpression><![CDATA[$V{Question4Count}-($V{Question4_response1}+$V{Question4_response2}+$V{Question4_response3}+$V{Question4_response4}+$V{Question4_response5})]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question5Count" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q5v2") ?1:0)]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question5_noResponse" class="java.lang.Integer" resetType="Group" resetGroup="Group2">
		<variableExpression><![CDATA[$V{Question5Count}-($V{Question5_response1}+$V{Question5_response2}+$V{Question5_response3}+$V{Question5_response4}+$V{Question5_response5})]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question5_response1" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q5v2") || $F{question_id}.equals("ssfcuag_sp_q5")) && $F{answer}.equals("1")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question5_response2" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q5v2") || $F{question_id}.equals("ssfcuag_sp_q5")) && $F{answer}.equals("2")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question5_response3" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q5v2") || $F{question_id}.equals("ssfcuag_sp_q5")) && $F{answer}.equals("3")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question5_response4" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q5v2") || $F{question_id}.equals("ssfcuag_sp_q5")) && $F{answer}.equals("4")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question5_response5" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q5v2") || $F{question_id}.equals("ssfcuag_sp_q5")) && $F{answer}.equals("5")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="DeclinedKey" class="java.lang.String" resetType="Group" resetGroup="Group2">
		<variableExpression><![CDATA["Declined"]]></variableExpression>
	</variable>
	<variable name="AcceptedKey" class="java.lang.String" resetType="Group" resetGroup="Group2">
		<variableExpression><![CDATA["Accepted "]]></variableExpression>
	</variable>
	<group name="Group1">
		<groupExpression><![CDATA[$F{agent}]]></groupExpression>
	</group>
	<group name="CallId">
		<groupExpression><![CDATA[$F{agent}]]></groupExpression>
	</group>
	<group name="Group2" isStartNewPage="true" keepTogether="true">
		<groupExpression><![CDATA[$F{agent}]]></groupExpression>
		<groupHeader>
			<band height="5">
				<property name="com.jaspersoft.studio.unit.height" value="px"/>
			</band>
		</groupHeader>
		<groupFooter>
			<band height="572">
				<property name="com.jaspersoft.studio.unit.height" value="px"/>
				<textField>
					<reportElement x="160" y="280" width="100" height="20" uuid="d4de5023-068e-4a2f-8182-2c1e3b5a7e38"/>
					<box padding="3">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textFieldExpression><![CDATA[$V{TotalDeclined}]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="160" y="240" width="100" height="20" uuid="fca77da7-299f-483d-b44c-c4a23e378dd6"/>
					<box padding="3">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textFieldExpression><![CDATA[$V{TotalOffered}]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="260" y="260" width="80" height="20" uuid="1b798aaf-d5a4-48f3-a612-b22d9429ae3d"/>
					<box padding="3">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textFieldExpression><![CDATA[$V{TotalOffered} > 0 ? String.format("%.0f%%",100.0*$V{Accepted}/$V{TotalOffered}):"NA"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="260" y="280" width="80" height="20" uuid="b5c74f52-8903-4b16-ac07-4a136a2dede3"/>
					<box padding="3">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textFieldExpression><![CDATA[$V{TotalOffered} > 0 ? String.format("%.0f%%",100.0*$V{TotalDeclined}/$V{TotalOffered}):"NA"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="260" y="240" width="80" height="20" uuid="79e624c6-2b3a-4c75-b686-b028fed5a549"/>
					<box padding="3">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textFieldExpression><![CDATA[""]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="0" y="240" width="160" height="20" uuid="b0c60f33-30e1-4b62-bce1-e807bc5ae093"/>
					<box padding="3">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textFieldExpression><![CDATA["Total Surveys Offered"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="160" y="260" width="100" height="20" uuid="88943bfe-5d88-4afe-b549-75fdcedaec61"/>
					<box padding="3">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textFieldExpression><![CDATA[$V{Accepted}]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="0" y="260" width="160" height="20" uuid="00484737-edbe-443d-b221-9472fd1915f5"/>
					<box padding="3">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textFieldExpression><![CDATA["Agent Surveys Accepted"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="0" y="280" width="160" height="20" uuid="4082ddc6-9f49-40b5-ad24-1f8a29f8e624"/>
					<box padding="3">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textFieldExpression><![CDATA["Total Surveys Declined"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="0" y="320" width="620" height="30" uuid="7322e216-7817-4444-b5fa-63b44fcb7f33"/>
					<box>
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Center" verticalAlignment="Middle">
						<font size="12" isBold="true"/>
					</textElement>
					<textFieldExpression><![CDATA["Agent Survey Details"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="0" y="350" width="150" height="40" uuid="1470d642-c9c3-45c7-8d79-9d2b0f5faf1e"/>
					<box>
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Center" verticalAlignment="Middle">
						<font isBold="true"/>
					</textElement>
					<textFieldExpression><![CDATA["Customer Prompts"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="150" y="350" width="100" height="20" uuid="440bc1bc-6657-4fc5-acb4-8c8697df2e10"/>
					<box>
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Center" verticalAlignment="Middle">
						<font isBold="true"/>
					</textElement>
					<textFieldExpression><![CDATA["Agreed"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="150" y="370" width="50" height="20" uuid="03ae5a5e-c838-4262-8e60-f0f8bc5f44a7"/>
					<box>
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Center" verticalAlignment="Middle">
						<font isBold="true"/>
					</textElement>
					<textFieldExpression><![CDATA["Count"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="200" y="370" width="50" height="20" uuid="cf0db665-5456-4cf0-aed6-7d54e448f869"/>
					<box>
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Center" verticalAlignment="Middle">
						<font isBold="true"/>
					</textElement>
					<textFieldExpression><![CDATA["Percent"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="250" y="370" width="50" height="20" uuid="837ab73d-e856-4813-9c44-7f16ab4e9d5c"/>
					<box>
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Center" verticalAlignment="Middle">
						<font isBold="true"/>
					</textElement>
					<textFieldExpression><![CDATA["Count"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="250" y="350" width="100" height="20" uuid="6d803cf6-8814-4c7b-8cf3-e5225e97b011"/>
					<box>
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Center" verticalAlignment="Middle">
						<font isBold="true"/>
					</textElement>
					<textFieldExpression><![CDATA["Disagreed"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="300" y="370" width="50" height="20" uuid="442c8059-1346-4320-8b60-b55725a02b90"/>
					<box>
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Center" verticalAlignment="Middle">
						<font isBold="true"/>
					</textElement>
					<textFieldExpression><![CDATA["Percent"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="350" y="370" width="50" height="20" uuid="29b3994e-ed74-4cf9-83f8-3578c46f0da1"/>
					<box>
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Center" verticalAlignment="Middle">
						<font isBold="true"/>
					</textElement>
					<textFieldExpression><![CDATA["Count"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="350" y="350" width="100" height="20" uuid="4bf335b6-e6ba-4c3f-90e0-b53fe796b412"/>
					<box>
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Center" verticalAlignment="Middle">
						<font isBold="true"/>
					</textElement>
					<textFieldExpression><![CDATA["No Response"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="400" y="370" width="50" height="20" uuid="b70b7cd3-f7bd-4e84-9c42-040913f8a99c"/>
					<box>
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Center" verticalAlignment="Middle">
						<font isBold="true"/>
					</textElement>
					<textFieldExpression><![CDATA["Percent"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="0" y="390" width="150" height="30" uuid="ea701381-a86e-4b63-ba43-c73c0ed8f18c"/>
					<box topPadding="1" leftPadding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement>
						<font size="8"/>
					</textElement>
					<textFieldExpression><![CDATA["1.  The Team Member was friendly and engaging."]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="0" y="420" width="150" height="30" uuid="daf60f2e-7cab-4116-9138-72936118688b"/>
					<box topPadding="1" leftPadding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement>
						<font size="8"/>
					</textElement>
					<textFieldExpression><![CDATA["2.  The Team Member treated me with respect."]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="0" y="450" width="150" height="30" uuid="21e96a4f-6395-42a1-9f35-0cd9410adae9"/>
					<box topPadding="1" leftPadding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement>
						<font size="8"/>
					</textElement>
					<textFieldExpression><![CDATA["3.  The Team Member was an active listener."]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="0" y="480" width="150" height="30" uuid="0b192ad0-5726-4192-982a-71635754fb58"/>
					<box topPadding="1" leftPadding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement>
						<font size="8"/>
					</textElement>
					<textFieldExpression><![CDATA["4.  The Team Member acknowledged the reason for my call."]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="0" y="220" width="340" height="20" uuid="4a9c097a-fa9d-4866-8ebc-ebd2b8bc453e"/>
					<box padding="3">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Center" verticalAlignment="Middle">
						<font isBold="true"/>
					</textElement>
					<textFieldExpression><![CDATA["Agent Survey"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="520" y="350" width="100" height="40" uuid="4626f08f-565e-4e37-8575-c348289c1b57"/>
					<box>
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Center" verticalAlignment="Middle">
						<font isBold="true"/>
					</textElement>
					<textFieldExpression><![CDATA["Average Weighted"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="0" y="0" width="850" height="40" uuid="cb2da143-2c1e-4b22-b50f-f2b8bf5ab2de">
						<property name="local_mesure_unitx" value="pixel"/>
						<property name="com.jaspersoft.studio.unit.x" value="px"/>
						<property name="local_mesure_unitwidth" value="pixel"/>
						<property name="com.jaspersoft.studio.unit.width" value="px"/>
						<property name="local_mesure_unitheight" value="pixel"/>
						<property name="com.jaspersoft.studio.unit.height" value="px"/>
					</reportElement>
					<textElement textAlignment="Center" verticalAlignment="Middle">
						<font fontName="Times New Roman" size="24"/>
					</textElement>
					<textFieldExpression><![CDATA[$F{agent}+" Report - Weekly"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="0" y="510" width="150" height="30" uuid="a4ccc3e9-1b40-4807-b806-1785d74a2505"/>
					<box topPadding="1" leftPadding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement>
						<font size="8"/>
					</textElement>
					<textFieldExpression><![CDATA["5.  The Team Member provided clear guidance and explanations"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="300" y="390" width="50" height="30" uuid="d63386f3-f806-4574-950b-db1150ad559d"/>
					<box padding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Right"/>
					<textFieldExpression><![CDATA[$V{Question1_response2} > 0 ? String.format("%.2f%%",100.0*$V{Question1_response2}/$V{Question1Count}):"NA"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="350" y="390" width="50" height="30" uuid="46a19860-5711-4efd-8544-6c200d59b86e"/>
					<box padding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Right"/>
					<textFieldExpression><![CDATA[$V{Question1_noResponse}]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="300" y="420" width="50" height="30" uuid="ad41d98e-68f5-4a27-9177-60118eb4b313"/>
					<box padding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Right"/>
					<textFieldExpression><![CDATA[$V{Question2_response2} > 0 ? String.format("%.2f%%",100.0*$V{Question2_response2}/$V{Question2Count}):"NA"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="350" y="420" width="50" height="30" uuid="bf35d8cd-98a9-443d-90ec-3ae01420e306"/>
					<box padding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Right"/>
					<textFieldExpression><![CDATA[$V{Question2_noResponse}]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="200" y="450" width="50" height="30" uuid="6005fad8-788c-479c-88ef-4aba0f2ae4ac"/>
					<box padding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Right"/>
					<textFieldExpression><![CDATA[$V{Question3_response1} > 0 ? String.format("%.2f%%",100.0*$V{Question3_response1}/$V{Question3Count}):"NA"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="200" y="480" width="50" height="30" uuid="7b0219fb-94d4-4893-b872-7974990cba4d"/>
					<box padding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Right"/>
					<textFieldExpression><![CDATA[$V{Question4_response1} > 0 ? String.format("%.2f%%",100.0*$V{Question4_response1}/$V{Question4Count}):"NA"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="350" y="450" width="50" height="30" uuid="7583f4e0-3082-4236-a819-c5380be0ffff"/>
					<box padding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Right"/>
					<textFieldExpression><![CDATA[$V{Question3_noResponse}]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="250" y="390" width="50" height="30" uuid="2d8c1c9f-f3d4-4c05-8310-2da970357f85"/>
					<box padding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Right"/>
					<textFieldExpression><![CDATA[$V{Question1_response2}]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="150" y="480" width="50" height="30" uuid="1b164648-1664-434e-b999-d0373871e680"/>
					<box padding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Right"/>
					<textFieldExpression><![CDATA[$V{Question4_response1}]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="250" y="420" width="50" height="30" uuid="85ba287d-9917-4706-a166-18e5dfda1a7c"/>
					<box padding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Right"/>
					<textFieldExpression><![CDATA[$V{Question2_response2}]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="350" y="480" width="50" height="30" uuid="b599b02a-3579-42a1-9d0b-528fed35de11"/>
					<box padding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Right"/>
					<textFieldExpression><![CDATA[$V{Question4_noResponse}]]></textFieldExpression>
				</textField>
				<textField pattern="#,##0.00#;(#,##0.00#-)">
					<reportElement x="520" y="390" width="100" height="30" uuid="1098a32c-019a-48ac-ac69-3a1ab0c75eb2"/>
					<box padding="3">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Center"/>
					<textFieldExpression><![CDATA[$V{Question1_response1}.doubleValue()/$V{Question1Count}.doubleValue()*2]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="250" y="450" width="50" height="30" uuid="51f3168e-898c-4b4b-bea3-f72c3842a354"/>
					<box padding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Right"/>
					<textFieldExpression><![CDATA[$V{Question3_response2}]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="400" y="480" width="50" height="30" uuid="c3efdcf8-b8a4-4bf7-8447-2f838f07c6ec"/>
					<box padding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Right"/>
					<textFieldExpression><![CDATA[$V{Question4_noResponse} > 0 ? String.format("%.2f%%",100.0*$V{Question4_noResponse}/$V{Question4Count}):"NA"]]></textFieldExpression>
				</textField>
				<textField pattern="#,##0.00#;(#,##0.00#-)">
					<reportElement x="520" y="450" width="100" height="30" uuid="07532224-0d5b-490b-9376-9d2907783427"/>
					<box padding="3">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Center"/>
					<textFieldExpression><![CDATA[$V{Question3_response1}.doubleValue()/$V{Question3Count}.doubleValue()*2]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="150" y="420" width="50" height="30" uuid="1848672a-7131-4eae-8b1e-405644f95dd0"/>
					<box padding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Right"/>
					<textFieldExpression><![CDATA[$V{Question2_response1}]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="400" y="420" width="50" height="30" uuid="4f3129ce-fdd1-4ccb-b06d-f3a5810affda"/>
					<box padding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Right"/>
					<textFieldExpression><![CDATA[$V{Question2_noResponse} > 0 ? String.format("%.2f%%",100.0*$V{Question2_noResponse}/$V{Question2Count}):"NA"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement key="" x="150" y="390" width="50" height="30" uuid="0d9af804-041e-48c8-9b05-2bc68289bdfc"/>
					<box padding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Right"/>
					<textFieldExpression><![CDATA[$V{Question1_response1}]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="400" y="390" width="50" height="30" uuid="49f73286-bb30-4d70-9d0c-cc0d7eb60287"/>
					<box padding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Right"/>
					<textFieldExpression><![CDATA[$V{Question1_noResponse} > 0 ? String.format("%.2f%%",100.0*$V{Question1_noResponse}/$V{Question1Count}):"NA"]]></textFieldExpression>
				</textField>
				<textField pattern="#,##0.00#;(#,##0.00#-)">
					<reportElement x="520" y="480" width="100" height="30" uuid="d9da58ee-c9f8-47fd-8ff6-fca99591d715"/>
					<box padding="3">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Center"/>
					<textFieldExpression><![CDATA[$V{Question4_response1}.doubleValue()/$V{Question4Count}.doubleValue()*2]]></textFieldExpression>
				</textField>
				<textField pattern="#,##0.00#;(#,##0.00#-)">
					<reportElement x="520" y="420" width="100" height="30" uuid="0ac735b2-cb1d-4208-b96a-43cc43f516cb"/>
					<box padding="3">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Center"/>
					<textFieldExpression><![CDATA[$V{Question2_response1}.doubleValue()/$V{Question2Count}.doubleValue()*2]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="150" y="450" width="50" height="30" uuid="c1d0e706-0216-45d9-b450-2febb8692df7"/>
					<box padding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Right"/>
					<textFieldExpression><![CDATA[$V{Question3_response1}]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="300" y="450" width="50" height="30" uuid="bd6f255f-15ff-4609-8743-a60f5c40f4be"/>
					<box padding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Right"/>
					<textFieldExpression><![CDATA[$V{Question3_response2} > 0 ? String.format("%.2f%%",100.0*$V{Question3_response2}/$V{Question2Count}):"NA"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="250" y="480" width="50" height="30" uuid="8ed0f3f0-11d3-48e3-806e-e14f0517b246"/>
					<box padding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Right"/>
					<textFieldExpression><![CDATA[$V{Question4_response2}]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="400" y="450" width="50" height="30" uuid="cc89b1fd-9b31-406e-b330-e0b5f4fee336"/>
					<box padding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Right"/>
					<textFieldExpression><![CDATA[$V{Question3_noResponse} > 0 ? String.format("%.2f%%",100.0*$V{Question3_noResponse}/$V{Question3Count}):"NA"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="200" y="390" width="50" height="30" uuid="220e930e-cff6-4eff-8445-a18d9a3d9c70"/>
					<box padding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Right"/>
					<textFieldExpression><![CDATA[$V{Question1_response1} > 0 ? String.format("%.2f%%",100.0*$V{Question1_response1}/$V{Question1Count}):"NA"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="200" y="420" width="50" height="30" uuid="7680e480-9f7c-4ea1-b6aa-2311bacc832a"/>
					<box padding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Right"/>
					<textFieldExpression><![CDATA[$V{Question2_response1} > 0 ? String.format("%.2f%%",100.0*$V{Question2_response1}/$V{Question2Count}):"NA"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="300" y="480" width="50" height="30" uuid="5b96d2fe-52b4-4649-b46c-2819c0f8c88c"/>
					<box padding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Right"/>
					<textFieldExpression><![CDATA[$V{Question4_response2} > 0 ? String.format("%.2f%%",100.0*$V{Question4_response2}/$V{Question4Count}):"NA"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="250" y="510" width="50" height="30" uuid="c5a07466-dc9e-46fe-b02e-3c1ef1cfcd4e"/>
					<box padding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Right"/>
					<textFieldExpression><![CDATA[$V{Question5_response2}]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="200" y="510" width="50" height="30" uuid="556c21f5-4e23-4b14-a502-4794b26fff30"/>
					<box padding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Right"/>
					<textFieldExpression><![CDATA[$V{Question5_response1} > 0 ? String.format("%.2f%%",100.0*$V{Question5_response1}/$V{Question5Count}):"NA"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="400" y="510" width="50" height="30" uuid="c371dab3-db80-4b73-95a2-709c490c5437"/>
					<box padding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Right"/>
					<textFieldExpression><![CDATA[$V{Question5_noResponse} > 0 ? String.format("%.2f%%",100.0*$V{Question5_noResponse}/$V{Question5Count}):"NA"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="150" y="510" width="50" height="30" uuid="88d2e562-9d18-45e4-b67a-1df801d1c4ac"/>
					<box padding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Right"/>
					<textFieldExpression><![CDATA[$V{Question5_response1}]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="300" y="510" width="50" height="30" uuid="06d6fb83-f6d9-4de1-9b77-733519d64390"/>
					<box padding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Right"/>
					<textFieldExpression><![CDATA[$V{Question5_response2} > 0 ? String.format("%.2f%%",100.0*$V{Question5_response2}/$V{Question5Count}):"NA"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="350" y="510" width="50" height="30" uuid="6a2e8c65-fdca-4901-be45-73a5550df12e"/>
					<box padding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Right"/>
					<textFieldExpression><![CDATA[$V{Question5_noResponse}]]></textFieldExpression>
				</textField>
				<textField pattern="#,##0.00#;(#,##0.00#-)">
					<reportElement x="520" y="510" width="100" height="30" uuid="ff63c02c-2eb5-4450-96bf-30905870c591"/>
					<box padding="3">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Center"/>
					<textFieldExpression><![CDATA[$V{Question5_response1}.doubleValue()/$V{Question5Count}.doubleValue()*2]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="500" y="39" width="349" height="21" uuid="c2e20103-df64-4f5d-b940-f81b2773f63f"/>
					<textElement textAlignment="Right" verticalAlignment="Middle">
						<font size="11"/>
					</textElement>
					<textFieldExpression><![CDATA[$P{SubTitle}]]></textFieldExpression>
				</textField>
				<image>
					<reportElement x="0" y="0" width="300" height="50" uuid="91102301-18f9-419b-949a-1fef9b7ff320"/>
					<imageExpression><![CDATA[$P{REPORT_MGR_BASE} +"/GetImage?image=swampfox_logo"]]></imageExpression>
				</image>
				<textField>
					<reportElement x="450" y="350" width="70" height="40" uuid="e814b2b2-abab-4057-b40d-5c1e4a10f93b"/>
					<box>
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Center" verticalAlignment="Middle">
						<font isBold="true"/>
					</textElement>
					<textFieldExpression><![CDATA["Assigned Weighting"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="450" y="390" width="70" height="30" forecolor="#030303" backcolor="#BFBFBF" uuid="b06771bd-4c06-46c2-852f-3c5494c94310"/>
					<box>
						<pen lineColor="#030000"/>
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Center" verticalAlignment="Middle">
						<font isBold="true"/>
					</textElement>
					<textFieldExpression><![CDATA[2]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="450" y="420" width="70" height="30" forecolor="#030303" backcolor="#BFBFBF" uuid="add56828-1611-40f7-97dd-2911b1021ecc"/>
					<box>
						<pen lineColor="#030000"/>
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Center" verticalAlignment="Middle">
						<font isBold="true"/>
					</textElement>
					<textFieldExpression><![CDATA[1]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="450" y="450" width="70" height="30" forecolor="#030303" backcolor="#BFBFBF" uuid="54ffa91b-f7ca-4b13-a2e9-261ff3e26056"/>
					<box>
						<pen lineColor="#030000"/>
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Center" verticalAlignment="Middle">
						<font isBold="true"/>
					</textElement>
					<textFieldExpression><![CDATA[1]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="450" y="510" width="70" height="30" forecolor="#030303" backcolor="#BFBFBF" uuid="cebe7363-0c9f-4911-b9e9-cda14326dac6"/>
					<box>
						<pen lineColor="#030000"/>
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Center" verticalAlignment="Middle">
						<font isBold="true"/>
					</textElement>
					<textFieldExpression><![CDATA[.5]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="0" y="90" width="180" height="20" uuid="304955be-d1ca-4e5d-9abe-25c441e0d78c"/>
					<box>
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Center" verticalAlignment="Middle">
						<font isBold="true"/>
					</textElement>
					<textFieldExpression><![CDATA["Overall Agent Rating"]]></textFieldExpression>
				</textField>
				<textField pattern="#,##0.0000;(#,##0.0000-)">
					<reportElement x="0" y="110" width="180" height="30" uuid="d5d4b675-8e70-4f64-934d-886c247db07b"/>
					<box padding="3">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Center"/>
					<textFieldExpression><![CDATA[($V{Question1_response1}.doubleValue()/$V{Question1Count}.doubleValue()*2
+ $V{Question2_response1}.doubleValue()/$V{Question2Count}.doubleValue()*1
+ $V{Question3_response1}.doubleValue()/$V{Question3Count}.doubleValue()*1
+ $V{Question4_response1}.doubleValue()/$V{Question4Count}.doubleValue()*.5
+ $V{Question5_response1}.doubleValue()/$V{Question5Count}.doubleValue()*.5)]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="450" y="480" width="70" height="30" forecolor="#030303" backcolor="#BFBFBF" uuid="e6076d4a-3728-4971-aa3d-4596b58975ee"/>
					<box>
						<pen lineColor="#030000"/>
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Center" verticalAlignment="Middle">
						<font isBold="true"/>
					</textElement>
					<textFieldExpression><![CDATA[.5]]></textFieldExpression>
				</textField>
				<textField pattern="#,##0.0000;(#,##0.0000-)">
					<reportElement x="0" y="170" width="180" height="30" uuid="51113e2f-cbcd-49bf-bc86-40ee41261878"/>
					<box padding="3">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Center"/>
					<textFieldExpression><![CDATA[($V{Question1_response1}.doubleValue()/$V{Question1Count}.doubleValue()*2
+ $V{Question2_response1}.doubleValue()/$V{Question2Count}.doubleValue()*1
+ $V{Question3_response1}.doubleValue()/$V{Question3Count}.doubleValue()*1
+ $V{Question4_response1}.doubleValue()/$V{Question4Count}.doubleValue()*.5
+ $V{Question5_response1}.doubleValue()/$V{Question5Count}.doubleValue()*.5)*20]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="0" y="150" width="180" height="20" uuid="21ae1c04-c9a2-4f35-bf4f-39114ed6e739"/>
					<box>
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Center" verticalAlignment="Middle">
						<font isBold="true"/>
					</textElement>
					<textFieldExpression><![CDATA["Overall Agent Grading"]]></textFieldExpression>
				</textField>
				<frame>
					<reportElement x="0" y="0" width="200" height="200" uuid="95946f45-a0d4-436c-b630-f9e85ac361d0"/>
				</frame>
				<textField>
					<reportElement x="0" y="0" width="50" height="30" uuid="11537238-70c2-4d89-956f-c656aeeedfa8"/>
					<textFieldExpression><![CDATA[$V{AcceptedKey}]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="0" y="0" width="50" height="30" uuid="7aef7731-73cb-44ca-8c9e-c50b03750dd0"/>
					<textFieldExpression><![CDATA[$V{AcceptedKey}]]></textFieldExpression>
				</textField>
			</band>
		</groupFooter>
	</group>
	<group name="paginationByAgent_Qualifier">
		<groupExpression><![CDATA[$F{inbound_call_id}]]></groupExpression>
	</group>
	<background>
		<band splitType="Stretch"/>
	</background>
	<title>
		<band>
			<property name="com.jaspersoft.studio.unit.height" value="px"/>
		</band>
	</title>
	<summary>
		<band height="1" splitType="Stretch">
			<property name="com.jaspersoft.studio.unit.height" value="px"/>
		</band>
	</summary>
</jasperReport>

', config_xml='', subreport=false, connection_id=100000002, jasper_report='<?xml version="1.0" encoding="UTF-8"?>
<!-- Created with Jaspersoft Studio version 6.20.6.final using JasperReports Library version 6.20.6-5c96b6aa8a39ac1dc6b6bea4b81168e16dd39231  -->
<jasperReport xmlns="http://jasperreports.sourceforge.net/jasperreports" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://jasperreports.sourceforge.net/jasperreports http://jasperreports.sourceforge.net/xsd/jasperreport.xsd" name="Survey" pageWidth="900" pageHeight="612" orientation="Landscape" whenNoDataType="NoDataSection" columnWidth="860" leftMargin="20" rightMargin="20" topMargin="20" bottomMargin="20" uuid="0009c862-0249-47d0-8af6-f1b3325c447c">
	<property name="com.jaspersoft.studio.data.defaultdataadapter" value="Sample DB"/>
	<property name="com.jaspersoft.studio.unit." value="pixel"/>
	<property name="com.jaspersoft.studio.unit.pageHeight" value="pixel"/>
	<property name="com.jaspersoft.studio.unit.pageWidth" value="pixel"/>
	<property name="com.jaspersoft.studio.unit.topMargin" value="pixel"/>
	<property name="com.jaspersoft.studio.unit.bottomMargin" value="pixel"/>
	<property name="com.jaspersoft.studio.unit.leftMargin" value="pixel"/>
	<property name="com.jaspersoft.studio.unit.rightMargin" value="pixel"/>
	<property name="com.jaspersoft.studio.unit.columnWidth" value="pixel"/>
	<property name="com.jaspersoft.studio.unit.columnSpacing" value="pixel"/>
	<property name="net.sf.jasperreports.chart.pie.ignore.duplicated.key" value="true"/>
	<property name="com.jaspersoft.studio.data.sql.tables" value=""/>
	<style name="Top2" mode="Transparent" backcolor="#FFFFFF" pattern="">
		<conditionalStyle>
			<conditionExpression><![CDATA[1==1]]></conditionExpression>
			<style mode="Transparent" forecolor="#8FA3FF"/>
		</conditionalStyle>
	</style>
	<subDataset name="Dataset1" uuid="0f8901ea-effb-497e-b44c-c7cc3b89bc41">
		<property name="com.jaspersoft.studio.data.sql.tables" value=""/>
		<property name="com.jaspersoft.studio.data.defaultdataadapter" value="FILProduction.jrdax"/>
		<queryString language="SQL">
			<![CDATA[select inbound_calls.start_date, inbound_calls.call_id as inbound_call_id, inbound_calls.surveyaccepted,flow_result_details.answer, flow_result_details.question_id,flow_result_details.answer_token,flow_results.*, inbound_calls.agent from inbound_calls
LEFT JOIN flow_results on inbound_calls.call_id = flow_results.request_id  or inbound_calls.call_id = flow_results.call_id
LEFT JOIN flow_result_details on flow_results.call_id = flow_result_details.call_id 
where inbound_calls.start_date > timezone(''UTC'', now()) - ''1 day''
order by inbound_calls.agent]]>
		</queryString>
		<group name="Group1"/>
	</subDataset>
	<parameter name="SubTitle" class="java.lang.String">
		<defaultValueExpression><![CDATA[""]]></defaultValueExpression>
	</parameter>
	<parameter name="where" class="java.lang.String">
		<parameterDescription><![CDATA[]]></parameterDescription>
		<defaultValueExpression><![CDATA["inbound_calls.start_date > timezone(''UTC'', now()) - interval ''1 week''"]]></defaultValueExpression>
	</parameter>
	<parameter name="REPORT_MGR_BASE" class="java.lang.String" isForPrompting="false" evaluationTime="Late">
		<parameterDescription><![CDATA[Base URL for Report Manager]]></parameterDescription>
		<defaultValueExpression><![CDATA["http://localhost:8080/ReportMgr"]]></defaultValueExpression>
	</parameter>
	<parameter name="WEB_APP_DIR" class="java.lang.String">
		<parameterDescription><![CDATA["putdirhere"]]></parameterDescription>
	</parameter>
	<parameter name="agent_ID" class="java.lang.String">
		<defaultValueExpression><![CDATA[$P{agent_ID}]]></defaultValueExpression>
	</parameter>
	<queryString>
		<![CDATA[select inbound_calls.start_date, inbound_calls.call_id as inbound_call_id, inbound_calls.surveyaccepted,flow_result_details.answer, flow_result_details.question_id,flow_result_details.answer_token,flow_results.*, inbound_calls.agent from inbound_calls 
LEFT JOIN flow_results on inbound_calls.call_id = flow_results.request_id  or inbound_calls.call_id = flow_results.call_id
LEFT JOIN flow_result_details on flow_results.call_id = flow_result_details.call_id 
where $P!{where}
order by inbound_calls.agent]]>
	</queryString>
	<field name="start_date" class="java.sql.Timestamp"/>
	<field name="inbound_call_id" class="java.lang.String"/>
	<field name="surveyaccepted" class="java.lang.Boolean"/>
	<field name="answer" class="java.lang.String"/>
	<field name="question_id" class="java.lang.String"/>
	<field name="answer_token" class="java.lang.String"/>
	<field name="call_id" class="java.lang.String"/>
	<field name="flow_id" class="java.lang.String"/>
	<field name="request_id" class="java.lang.String"/>
	<field name="dnis" class="java.lang.String"/>
	<field name="ani" class="java.lang.String"/>
	<field name="session_id" class="java.lang.String"/>
	<field name="COLUMN_13" class="java.sql.Timestamp"/>
	<field name="end_date" class="java.sql.Timestamp"/>
	<field name="completed" class="java.lang.Boolean"/>
	<field name="end_reason" class="java.lang.String"/>
	<field name="call_classification" class="java.lang.String"/>
	<field name="agent" class="java.lang.String"/>
	<variable name="Accepted" class="java.lang.Integer" resetType="Group" resetGroup="Group2" incrementType="Group" incrementGroup="paginationByAgent_Qualifier" calculation="Sum">
		<variableExpression><![CDATA[$F{surveyaccepted}?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="TotalDeclined" class="java.lang.Integer" resetType="Group" resetGroup="Group2" incrementType="Group" incrementGroup="paginationByAgent_Qualifier" calculation="Sum">
		<variableExpression><![CDATA[$F{surveyaccepted}?0:1]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="TotalOffered" class="java.lang.Integer" resetType="Group" resetGroup="Group2">
		<variableExpression><![CDATA[$V{TotalDeclined}+$V{Accepted}]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question1_response1" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q1v2") || $F{question_id}.equals("ssfcuag_sp_q1")) && $F{answer}.equals("1")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question1_response2" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q1v2") || $F{question_id}.equals("ssfcuag_sp_q1")) && $F{answer}.equals("2")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question1_response3" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q1v2") || $F{question_id}.equals("ssfcuag_sp_q1")) && $F{answer}.equals("3")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question1_response4" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q1v2") || $F{question_id}.equals("ssfcuag_sp_q1")) && $F{answer}.equals("4")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question1_response5" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q1v2") || $F{question_id}.equals("ssfcuag_sp_q1")) && $F{answer}.equals("5")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question2_response1" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q2v2") || $F{question_id}.equals("ssfcuag_sp_q2")) && $F{answer}.equals("1")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question2_response2" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q2v2") || $F{question_id}.equals("ssfcuag_sp_q2")) && $F{answer}.equals("2")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question2_response3" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q2v2") || $F{question_id}.equals("ssfcuag_sp_q2")) && $F{answer}.equals("3")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question2_response4" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q2v2") || $F{question_id}.equals("ssfcuag_sp_q2")) && $F{answer}.equals("4")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question2_response5" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q2v2") || $F{question_id}.equals("ssfcuag_sp_q2")) && $F{answer}.equals("5")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question3_response1" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q3v2") || $F{question_id}.equals("ssfcuag_sp_q3")) && $F{answer}.equals("1")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question3_response2" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q3v2") || $F{question_id}.equals("ssfcuag_sp_q3")) && $F{answer}.equals("2")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question3_response3" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q3v2") || $F{question_id}.equals("ssfcuag_sp_q3")) && $F{answer}.equals("3")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question3_response4" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q3v2") || $F{question_id}.equals("ssfcuag_sp_q3")) && $F{answer}.equals("4")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question3_response5" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q3v2") || $F{question_id}.equals("ssfcuag_sp_q3")) && $F{answer}.equals("5")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question4_response1" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q4v2") || $F{question_id}.equals("ssfcuag_sp_q4")) && $F{answer}.equals("1")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question4_response2" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q4v2") || $F{question_id}.equals("ssfcuag_sp_q4")) && $F{answer}.equals("2")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question4_response3" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q4v2") || $F{question_id}.equals("ssfcuag_sp_q4")) && $F{answer}.equals("3")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question4_response4" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q4v2") || $F{question_id}.equals("ssfcuag_sp_q4")) && $F{answer}.equals("4")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question4_response5" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q4v2") || $F{question_id}.equals("ssfcuag_sp_q4")) && $F{answer}.equals("5")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Answer" class="java.lang.String" resetType="Group" resetGroup="Group2">
		<variableExpression><![CDATA[$F{answer}==null?"":$F{answer}]]></variableExpression>
	</variable>
	<variable name="response1" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[$F{question_id}.equals("ge_agent_sat_q1v2") && $F{answer}.equals("1")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="response2" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[$F{question_id}.equals("ge_agent_sat_q1v2") && $F{answer}.equals("2")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="response3" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[$F{question_id}.equals("ge_agent_sat_q1v2") && $F{answer}.equals("3")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="response4" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[$F{question_id}.equals("ge_agent_sat_q1v2") && $F{answer}.equals("4")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="response5" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[$F{question_id}.equals("ge_agent_sat_q1v2") && $F{answer}.equals("5")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="noresponse" class="java.lang.Integer" resetType="Group" resetGroup="Group2"/>
	<variable name="Question1Count" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q1v2") ?1:0)]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question2Count" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q2v2") ?1:0)]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question3Count" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q3v2")  ?1:0)]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question4Count" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q4v2") ?1:0)]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question1_noResponse" class="java.lang.Integer" resetType="Group" resetGroup="Group2">
		<variableExpression><![CDATA[$V{Question1Count}-($V{Question1_response1}+$V{Question1_response2}+$V{Question1_response3}+$V{Question1_response4}+$V{Question1_response5})]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question2_noResponse" class="java.lang.Integer" resetType="Group" resetGroup="Group2">
		<variableExpression><![CDATA[$V{Question1Count}-($V{Question1_response1}+$V{Question1_response2}+$V{Question1_response3}+$V{Question1_response4}+$V{Question1_response5})]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question3_noResponse" class="java.lang.Integer" resetType="Group" resetGroup="Group2">
		<variableExpression><![CDATA[$V{Question3Count}-($V{Question3_response1}+$V{Question3_response2}+$V{Question3_response3}+$V{Question3_response4}+$V{Question3_response5})]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question4_noResponse" class="java.lang.Integer" resetType="Group" resetGroup="Group2">
		<variableExpression><![CDATA[$V{Question4Count}-($V{Question4_response1}+$V{Question4_response2}+$V{Question4_response3}+$V{Question4_response4}+$V{Question4_response5})]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question5Count" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q5v2") ?1:0)]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question5_noResponse" class="java.lang.Integer" resetType="Group" resetGroup="Group2">
		<variableExpression><![CDATA[$V{Question5Count}-($V{Question5_response1}+$V{Question5_response2}+$V{Question5_response3}+$V{Question5_response4}+$V{Question5_response5})]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question5_response1" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q5v2") || $F{question_id}.equals("ssfcuag_sp_q5")) && $F{answer}.equals("1")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question5_response2" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q5v2") || $F{question_id}.equals("ssfcuag_sp_q5")) && $F{answer}.equals("2")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question5_response3" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q5v2") || $F{question_id}.equals("ssfcuag_sp_q5")) && $F{answer}.equals("3")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question5_response4" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q5v2") || $F{question_id}.equals("ssfcuag_sp_q5")) && $F{answer}.equals("4")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question5_response5" class="java.lang.Integer" resetType="Group" resetGroup="Group2" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q5v2") || $F{question_id}.equals("ssfcuag_sp_q5")) && $F{answer}.equals("5")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="DeclinedKey" class="java.lang.String" resetType="Group" resetGroup="Group2">
		<variableExpression><![CDATA["Declined"]]></variableExpression>
	</variable>
	<variable name="AcceptedKey" class="java.lang.String" resetType="Group" resetGroup="Group2">
		<variableExpression><![CDATA["Accepted "]]></variableExpression>
	</variable>
	<group name="Group1">
		<groupExpression><![CDATA[$F{agent}]]></groupExpression>
	</group>
	<group name="CallId">
		<groupExpression><![CDATA[$F{agent}]]></groupExpression>
	</group>
	<group name="Group2" isStartNewPage="true" keepTogether="true">
		<groupExpression><![CDATA[$F{agent}]]></groupExpression>
		<groupHeader>
			<band height="5">
				<property name="com.jaspersoft.studio.unit.height" value="px"/>
			</band>
		</groupHeader>
		<groupFooter>
			<band height="572">
				<property name="com.jaspersoft.studio.unit.height" value="px"/>
				<textField>
					<reportElement x="160" y="280" width="100" height="20" uuid="d4de5023-068e-4a2f-8182-2c1e3b5a7e38"/>
					<box padding="3">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textFieldExpression><![CDATA[$V{TotalDeclined}]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="160" y="240" width="100" height="20" uuid="fca77da7-299f-483d-b44c-c4a23e378dd6"/>
					<box padding="3">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textFieldExpression><![CDATA[$V{TotalOffered}]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="260" y="260" width="80" height="20" uuid="1b798aaf-d5a4-48f3-a612-b22d9429ae3d"/>
					<box padding="3">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textFieldExpression><![CDATA[$V{TotalOffered} > 0 ? String.format("%.0f%%",100.0*$V{Accepted}/$V{TotalOffered}):"NA"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="260" y="280" width="80" height="20" uuid="b5c74f52-8903-4b16-ac07-4a136a2dede3"/>
					<box padding="3">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textFieldExpression><![CDATA[$V{TotalOffered} > 0 ? String.format("%.0f%%",100.0*$V{TotalDeclined}/$V{TotalOffered}):"NA"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="260" y="240" width="80" height="20" uuid="79e624c6-2b3a-4c75-b686-b028fed5a549"/>
					<box padding="3">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textFieldExpression><![CDATA[""]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="0" y="240" width="160" height="20" uuid="b0c60f33-30e1-4b62-bce1-e807bc5ae093"/>
					<box padding="3">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textFieldExpression><![CDATA["Total Surveys Offered"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="160" y="260" width="100" height="20" uuid="88943bfe-5d88-4afe-b549-75fdcedaec61"/>
					<box padding="3">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textFieldExpression><![CDATA[$V{Accepted}]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="0" y="260" width="160" height="20" uuid="00484737-edbe-443d-b221-9472fd1915f5"/>
					<box padding="3">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textFieldExpression><![CDATA["Agent Surveys Accepted"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="0" y="280" width="160" height="20" uuid="4082ddc6-9f49-40b5-ad24-1f8a29f8e624"/>
					<box padding="3">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textFieldExpression><![CDATA["Total Surveys Declined"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="0" y="320" width="620" height="30" uuid="7322e216-7817-4444-b5fa-63b44fcb7f33"/>
					<box>
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Center" verticalAlignment="Middle">
						<font size="12" isBold="true"/>
					</textElement>
					<textFieldExpression><![CDATA["Agent Survey Details"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="0" y="350" width="150" height="40" uuid="1470d642-c9c3-45c7-8d79-9d2b0f5faf1e"/>
					<box>
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Center" verticalAlignment="Middle">
						<font isBold="true"/>
					</textElement>
					<textFieldExpression><![CDATA["Customer Prompts"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="150" y="350" width="100" height="20" uuid="440bc1bc-6657-4fc5-acb4-8c8697df2e10"/>
					<box>
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Center" verticalAlignment="Middle">
						<font isBold="true"/>
					</textElement>
					<textFieldExpression><![CDATA["Agreed"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="150" y="370" width="50" height="20" uuid="03ae5a5e-c838-4262-8e60-f0f8bc5f44a7"/>
					<box>
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Center" verticalAlignment="Middle">
						<font isBold="true"/>
					</textElement>
					<textFieldExpression><![CDATA["Count"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="200" y="370" width="50" height="20" uuid="cf0db665-5456-4cf0-aed6-7d54e448f869"/>
					<box>
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Center" verticalAlignment="Middle">
						<font isBold="true"/>
					</textElement>
					<textFieldExpression><![CDATA["Percent"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="250" y="370" width="50" height="20" uuid="837ab73d-e856-4813-9c44-7f16ab4e9d5c"/>
					<box>
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Center" verticalAlignment="Middle">
						<font isBold="true"/>
					</textElement>
					<textFieldExpression><![CDATA["Count"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="250" y="350" width="100" height="20" uuid="6d803cf6-8814-4c7b-8cf3-e5225e97b011"/>
					<box>
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Center" verticalAlignment="Middle">
						<font isBold="true"/>
					</textElement>
					<textFieldExpression><![CDATA["Disagreed"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="300" y="370" width="50" height="20" uuid="442c8059-1346-4320-8b60-b55725a02b90"/>
					<box>
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Center" verticalAlignment="Middle">
						<font isBold="true"/>
					</textElement>
					<textFieldExpression><![CDATA["Percent"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="350" y="370" width="50" height="20" uuid="29b3994e-ed74-4cf9-83f8-3578c46f0da1"/>
					<box>
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Center" verticalAlignment="Middle">
						<font isBold="true"/>
					</textElement>
					<textFieldExpression><![CDATA["Count"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="350" y="350" width="100" height="20" uuid="4bf335b6-e6ba-4c3f-90e0-b53fe796b412"/>
					<box>
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Center" verticalAlignment="Middle">
						<font isBold="true"/>
					</textElement>
					<textFieldExpression><![CDATA["No Response"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="400" y="370" width="50" height="20" uuid="b70b7cd3-f7bd-4e84-9c42-040913f8a99c"/>
					<box>
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Center" verticalAlignment="Middle">
						<font isBold="true"/>
					</textElement>
					<textFieldExpression><![CDATA["Percent"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="0" y="390" width="150" height="30" uuid="ea701381-a86e-4b63-ba43-c73c0ed8f18c"/>
					<box topPadding="1" leftPadding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement>
						<font size="8"/>
					</textElement>
					<textFieldExpression><![CDATA["1.  The Team Member was friendly and engaging."]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="0" y="420" width="150" height="30" uuid="daf60f2e-7cab-4116-9138-72936118688b"/>
					<box topPadding="1" leftPadding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement>
						<font size="8"/>
					</textElement>
					<textFieldExpression><![CDATA["2.  The Team Member treated me with respect."]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="0" y="450" width="150" height="30" uuid="21e96a4f-6395-42a1-9f35-0cd9410adae9"/>
					<box topPadding="1" leftPadding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement>
						<font size="8"/>
					</textElement>
					<textFieldExpression><![CDATA["3.  The Team Member was an active listener."]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="0" y="480" width="150" height="30" uuid="0b192ad0-5726-4192-982a-71635754fb58"/>
					<box topPadding="1" leftPadding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement>
						<font size="8"/>
					</textElement>
					<textFieldExpression><![CDATA["4.  The Team Member acknowledged the reason for my call."]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="0" y="220" width="340" height="20" uuid="4a9c097a-fa9d-4866-8ebc-ebd2b8bc453e"/>
					<box padding="3">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Center" verticalAlignment="Middle">
						<font isBold="true"/>
					</textElement>
					<textFieldExpression><![CDATA["Agent Survey"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="520" y="350" width="100" height="40" uuid="4626f08f-565e-4e37-8575-c348289c1b57"/>
					<box>
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Center" verticalAlignment="Middle">
						<font isBold="true"/>
					</textElement>
					<textFieldExpression><![CDATA["Average Weighted"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="0" y="0" width="850" height="40" uuid="cb2da143-2c1e-4b22-b50f-f2b8bf5ab2de">
						<property name="local_mesure_unitx" value="pixel"/>
						<property name="com.jaspersoft.studio.unit.x" value="px"/>
						<property name="local_mesure_unitwidth" value="pixel"/>
						<property name="com.jaspersoft.studio.unit.width" value="px"/>
						<property name="local_mesure_unitheight" value="pixel"/>
						<property name="com.jaspersoft.studio.unit.height" value="px"/>
					</reportElement>
					<textElement textAlignment="Center" verticalAlignment="Middle">
						<font fontName="Times New Roman" size="24"/>
					</textElement>
					<textFieldExpression><![CDATA[$F{agent}+" Report - Weekly"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="0" y="510" width="150" height="30" uuid="a4ccc3e9-1b40-4807-b806-1785d74a2505"/>
					<box topPadding="1" leftPadding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement>
						<font size="8"/>
					</textElement>
					<textFieldExpression><![CDATA["5.  The Team Member provided clear guidance and explanations"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="300" y="390" width="50" height="30" uuid="d63386f3-f806-4574-950b-db1150ad559d"/>
					<box padding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Right"/>
					<textFieldExpression><![CDATA[$V{Question1_response2} > 0 ? String.format("%.2f%%",100.0*$V{Question1_response2}/$V{Question1Count}):"NA"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="350" y="390" width="50" height="30" uuid="46a19860-5711-4efd-8544-6c200d59b86e"/>
					<box padding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Right"/>
					<textFieldExpression><![CDATA[$V{Question1_noResponse}]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="300" y="420" width="50" height="30" uuid="ad41d98e-68f5-4a27-9177-60118eb4b313"/>
					<box padding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Right"/>
					<textFieldExpression><![CDATA[$V{Question2_response2} > 0 ? String.format("%.2f%%",100.0*$V{Question2_response2}/$V{Question2Count}):"NA"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="350" y="420" width="50" height="30" uuid="bf35d8cd-98a9-443d-90ec-3ae01420e306"/>
					<box padding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Right"/>
					<textFieldExpression><![CDATA[$V{Question2_noResponse}]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="200" y="450" width="50" height="30" uuid="6005fad8-788c-479c-88ef-4aba0f2ae4ac"/>
					<box padding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Right"/>
					<textFieldExpression><![CDATA[$V{Question3_response1} > 0 ? String.format("%.2f%%",100.0*$V{Question3_response1}/$V{Question3Count}):"NA"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="200" y="480" width="50" height="30" uuid="7b0219fb-94d4-4893-b872-7974990cba4d"/>
					<box padding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Right"/>
					<textFieldExpression><![CDATA[$V{Question4_response1} > 0 ? String.format("%.2f%%",100.0*$V{Question4_response1}/$V{Question4Count}):"NA"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="350" y="450" width="50" height="30" uuid="7583f4e0-3082-4236-a819-c5380be0ffff"/>
					<box padding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Right"/>
					<textFieldExpression><![CDATA[$V{Question3_noResponse}]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="250" y="390" width="50" height="30" uuid="2d8c1c9f-f3d4-4c05-8310-2da970357f85"/>
					<box padding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Right"/>
					<textFieldExpression><![CDATA[$V{Question1_response2}]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="150" y="480" width="50" height="30" uuid="1b164648-1664-434e-b999-d0373871e680"/>
					<box padding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Right"/>
					<textFieldExpression><![CDATA[$V{Question4_response1}]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="250" y="420" width="50" height="30" uuid="85ba287d-9917-4706-a166-18e5dfda1a7c"/>
					<box padding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Right"/>
					<textFieldExpression><![CDATA[$V{Question2_response2}]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="350" y="480" width="50" height="30" uuid="b599b02a-3579-42a1-9d0b-528fed35de11"/>
					<box padding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Right"/>
					<textFieldExpression><![CDATA[$V{Question4_noResponse}]]></textFieldExpression>
				</textField>
				<textField pattern="#,##0.00#;(#,##0.00#-)">
					<reportElement x="520" y="390" width="100" height="30" uuid="1098a32c-019a-48ac-ac69-3a1ab0c75eb2"/>
					<box padding="3">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Center"/>
					<textFieldExpression><![CDATA[$V{Question1_response1}.doubleValue()/$V{Question1Count}.doubleValue()*2]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="250" y="450" width="50" height="30" uuid="51f3168e-898c-4b4b-bea3-f72c3842a354"/>
					<box padding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Right"/>
					<textFieldExpression><![CDATA[$V{Question3_response2}]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="400" y="480" width="50" height="30" uuid="c3efdcf8-b8a4-4bf7-8447-2f838f07c6ec"/>
					<box padding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Right"/>
					<textFieldExpression><![CDATA[$V{Question4_noResponse} > 0 ? String.format("%.2f%%",100.0*$V{Question4_noResponse}/$V{Question4Count}):"NA"]]></textFieldExpression>
				</textField>
				<textField pattern="#,##0.00#;(#,##0.00#-)">
					<reportElement x="520" y="450" width="100" height="30" uuid="07532224-0d5b-490b-9376-9d2907783427"/>
					<box padding="3">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Center"/>
					<textFieldExpression><![CDATA[$V{Question3_response1}.doubleValue()/$V{Question3Count}.doubleValue()*2]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="150" y="420" width="50" height="30" uuid="1848672a-7131-4eae-8b1e-405644f95dd0"/>
					<box padding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Right"/>
					<textFieldExpression><![CDATA[$V{Question2_response1}]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="400" y="420" width="50" height="30" uuid="4f3129ce-fdd1-4ccb-b06d-f3a5810affda"/>
					<box padding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Right"/>
					<textFieldExpression><![CDATA[$V{Question2_noResponse} > 0 ? String.format("%.2f%%",100.0*$V{Question2_noResponse}/$V{Question2Count}):"NA"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement key="" x="150" y="390" width="50" height="30" uuid="0d9af804-041e-48c8-9b05-2bc68289bdfc"/>
					<box padding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Right"/>
					<textFieldExpression><![CDATA[$V{Question1_response1}]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="400" y="390" width="50" height="30" uuid="49f73286-bb30-4d70-9d0c-cc0d7eb60287"/>
					<box padding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Right"/>
					<textFieldExpression><![CDATA[$V{Question1_noResponse} > 0 ? String.format("%.2f%%",100.0*$V{Question1_noResponse}/$V{Question1Count}):"NA"]]></textFieldExpression>
				</textField>
				<textField pattern="#,##0.00#;(#,##0.00#-)">
					<reportElement x="520" y="480" width="100" height="30" uuid="d9da58ee-c9f8-47fd-8ff6-fca99591d715"/>
					<box padding="3">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Center"/>
					<textFieldExpression><![CDATA[$V{Question4_response1}.doubleValue()/$V{Question4Count}.doubleValue()*2]]></textFieldExpression>
				</textField>
				<textField pattern="#,##0.00#;(#,##0.00#-)">
					<reportElement x="520" y="420" width="100" height="30" uuid="0ac735b2-cb1d-4208-b96a-43cc43f516cb"/>
					<box padding="3">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Center"/>
					<textFieldExpression><![CDATA[$V{Question2_response1}.doubleValue()/$V{Question2Count}.doubleValue()*2]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="150" y="450" width="50" height="30" uuid="c1d0e706-0216-45d9-b450-2febb8692df7"/>
					<box padding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Right"/>
					<textFieldExpression><![CDATA[$V{Question3_response1}]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="300" y="450" width="50" height="30" uuid="bd6f255f-15ff-4609-8743-a60f5c40f4be"/>
					<box padding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Right"/>
					<textFieldExpression><![CDATA[$V{Question3_response2} > 0 ? String.format("%.2f%%",100.0*$V{Question3_response2}/$V{Question2Count}):"NA"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="250" y="480" width="50" height="30" uuid="8ed0f3f0-11d3-48e3-806e-e14f0517b246"/>
					<box padding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Right"/>
					<textFieldExpression><![CDATA[$V{Question4_response2}]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="400" y="450" width="50" height="30" uuid="cc89b1fd-9b31-406e-b330-e0b5f4fee336"/>
					<box padding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Right"/>
					<textFieldExpression><![CDATA[$V{Question3_noResponse} > 0 ? String.format("%.2f%%",100.0*$V{Question3_noResponse}/$V{Question3Count}):"NA"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="200" y="390" width="50" height="30" uuid="220e930e-cff6-4eff-8445-a18d9a3d9c70"/>
					<box padding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Right"/>
					<textFieldExpression><![CDATA[$V{Question1_response1} > 0 ? String.format("%.2f%%",100.0*$V{Question1_response1}/$V{Question1Count}):"NA"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="200" y="420" width="50" height="30" uuid="7680e480-9f7c-4ea1-b6aa-2311bacc832a"/>
					<box padding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Right"/>
					<textFieldExpression><![CDATA[$V{Question2_response1} > 0 ? String.format("%.2f%%",100.0*$V{Question2_response1}/$V{Question2Count}):"NA"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="300" y="480" width="50" height="30" uuid="5b96d2fe-52b4-4649-b46c-2819c0f8c88c"/>
					<box padding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Right"/>
					<textFieldExpression><![CDATA[$V{Question4_response2} > 0 ? String.format("%.2f%%",100.0*$V{Question4_response2}/$V{Question4Count}):"NA"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="250" y="510" width="50" height="30" uuid="c5a07466-dc9e-46fe-b02e-3c1ef1cfcd4e"/>
					<box padding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Right"/>
					<textFieldExpression><![CDATA[$V{Question5_response2}]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="200" y="510" width="50" height="30" uuid="556c21f5-4e23-4b14-a502-4794b26fff30"/>
					<box padding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Right"/>
					<textFieldExpression><![CDATA[$V{Question5_response1} > 0 ? String.format("%.2f%%",100.0*$V{Question5_response1}/$V{Question5Count}):"NA"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="400" y="510" width="50" height="30" uuid="c371dab3-db80-4b73-95a2-709c490c5437"/>
					<box padding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Right"/>
					<textFieldExpression><![CDATA[$V{Question5_noResponse} > 0 ? String.format("%.2f%%",100.0*$V{Question5_noResponse}/$V{Question5Count}):"NA"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="150" y="510" width="50" height="30" uuid="88d2e562-9d18-45e4-b67a-1df801d1c4ac"/>
					<box padding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Right"/>
					<textFieldExpression><![CDATA[$V{Question5_response1}]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="300" y="510" width="50" height="30" uuid="06d6fb83-f6d9-4de1-9b77-733519d64390"/>
					<box padding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Right"/>
					<textFieldExpression><![CDATA[$V{Question5_response2} > 0 ? String.format("%.2f%%",100.0*$V{Question5_response2}/$V{Question5Count}):"NA"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="350" y="510" width="50" height="30" uuid="6a2e8c65-fdca-4901-be45-73a5550df12e"/>
					<box padding="2">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Right"/>
					<textFieldExpression><![CDATA[$V{Question5_noResponse}]]></textFieldExpression>
				</textField>
				<textField pattern="#,##0.00#;(#,##0.00#-)">
					<reportElement x="520" y="510" width="100" height="30" uuid="ff63c02c-2eb5-4450-96bf-30905870c591"/>
					<box padding="3">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Center"/>
					<textFieldExpression><![CDATA[$V{Question5_response1}.doubleValue()/$V{Question5Count}.doubleValue()*2]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="500" y="39" width="349" height="21" uuid="c2e20103-df64-4f5d-b940-f81b2773f63f"/>
					<textElement textAlignment="Right" verticalAlignment="Middle">
						<font size="11"/>
					</textElement>
					<textFieldExpression><![CDATA[$P{SubTitle}]]></textFieldExpression>
				</textField>
				<image>
					<reportElement x="0" y="0" width="300" height="50" uuid="91102301-18f9-419b-949a-1fef9b7ff320"/>
					<imageExpression><![CDATA[$P{REPORT_MGR_BASE} +"/GetImage?image=swampfox_logo"]]></imageExpression>
				</image>
				<textField>
					<reportElement x="450" y="350" width="70" height="40" uuid="e814b2b2-abab-4057-b40d-5c1e4a10f93b"/>
					<box>
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Center" verticalAlignment="Middle">
						<font isBold="true"/>
					</textElement>
					<textFieldExpression><![CDATA["Assigned Weighting"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="450" y="390" width="70" height="30" forecolor="#030303" backcolor="#BFBFBF" uuid="b06771bd-4c06-46c2-852f-3c5494c94310"/>
					<box>
						<pen lineColor="#030000"/>
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Center" verticalAlignment="Middle">
						<font isBold="true"/>
					</textElement>
					<textFieldExpression><![CDATA[2]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="450" y="420" width="70" height="30" forecolor="#030303" backcolor="#BFBFBF" uuid="add56828-1611-40f7-97dd-2911b1021ecc"/>
					<box>
						<pen lineColor="#030000"/>
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Center" verticalAlignment="Middle">
						<font isBold="true"/>
					</textElement>
					<textFieldExpression><![CDATA[1]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="450" y="450" width="70" height="30" forecolor="#030303" backcolor="#BFBFBF" uuid="54ffa91b-f7ca-4b13-a2e9-261ff3e26056"/>
					<box>
						<pen lineColor="#030000"/>
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Center" verticalAlignment="Middle">
						<font isBold="true"/>
					</textElement>
					<textFieldExpression><![CDATA[1]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="450" y="510" width="70" height="30" forecolor="#030303" backcolor="#BFBFBF" uuid="cebe7363-0c9f-4911-b9e9-cda14326dac6"/>
					<box>
						<pen lineColor="#030000"/>
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Center" verticalAlignment="Middle">
						<font isBold="true"/>
					</textElement>
					<textFieldExpression><![CDATA[.5]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="0" y="90" width="180" height="20" uuid="304955be-d1ca-4e5d-9abe-25c441e0d78c"/>
					<box>
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Center" verticalAlignment="Middle">
						<font isBold="true"/>
					</textElement>
					<textFieldExpression><![CDATA["Overall Agent Rating"]]></textFieldExpression>
				</textField>
				<textField pattern="#,##0.0000;(#,##0.0000-)">
					<reportElement x="0" y="110" width="180" height="30" uuid="d5d4b675-8e70-4f64-934d-886c247db07b"/>
					<box padding="3">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Center"/>
					<textFieldExpression><![CDATA[($V{Question1_response1}.doubleValue()/$V{Question1Count}.doubleValue()*2
+ $V{Question2_response1}.doubleValue()/$V{Question2Count}.doubleValue()*1
+ $V{Question3_response1}.doubleValue()/$V{Question3Count}.doubleValue()*1
+ $V{Question4_response1}.doubleValue()/$V{Question4Count}.doubleValue()*.5
+ $V{Question5_response1}.doubleValue()/$V{Question5Count}.doubleValue()*.5)]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="450" y="480" width="70" height="30" forecolor="#030303" backcolor="#BFBFBF" uuid="e6076d4a-3728-4971-aa3d-4596b58975ee"/>
					<box>
						<pen lineColor="#030000"/>
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Center" verticalAlignment="Middle">
						<font isBold="true"/>
					</textElement>
					<textFieldExpression><![CDATA[.5]]></textFieldExpression>
				</textField>
				<textField pattern="#,##0.0000;(#,##0.0000-)">
					<reportElement x="0" y="170" width="180" height="30" uuid="51113e2f-cbcd-49bf-bc86-40ee41261878"/>
					<box padding="3">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Center"/>
					<textFieldExpression><![CDATA[($V{Question1_response1}.doubleValue()/$V{Question1Count}.doubleValue()*2
+ $V{Question2_response1}.doubleValue()/$V{Question2Count}.doubleValue()*1
+ $V{Question3_response1}.doubleValue()/$V{Question3Count}.doubleValue()*1
+ $V{Question4_response1}.doubleValue()/$V{Question4Count}.doubleValue()*.5
+ $V{Question5_response1}.doubleValue()/$V{Question5Count}.doubleValue()*.5)*20]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="0" y="150" width="180" height="20" uuid="21ae1c04-c9a2-4f35-bf4f-39114ed6e739"/>
					<box>
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Center" verticalAlignment="Middle">
						<font isBold="true"/>
					</textElement>
					<textFieldExpression><![CDATA["Overall Agent Grading"]]></textFieldExpression>
				</textField>
				<frame>
					<reportElement x="0" y="0" width="200" height="200" uuid="95946f45-a0d4-436c-b630-f9e85ac361d0"/>
				</frame>
				<textField>
					<reportElement x="0" y="0" width="50" height="30" uuid="11537238-70c2-4d89-956f-c656aeeedfa8"/>
					<textFieldExpression><![CDATA[$V{AcceptedKey}]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="0" y="0" width="50" height="30" uuid="7aef7731-73cb-44ca-8c9e-c50b03750dd0"/>
					<textFieldExpression><![CDATA[$V{AcceptedKey}]]></textFieldExpression>
				</textField>
			</band>
		</groupFooter>
	</group>
	<group name="paginationByAgent_Qualifier">
		<groupExpression><![CDATA[$F{inbound_call_id}]]></groupExpression>
	</group>
	<background>
		<band splitType="Stretch"/>
	</background>
	<title>
		<band>
			<property name="com.jaspersoft.studio.unit.height" value="px"/>
		</band>
	</title>
	<summary>
		<band height="1" splitType="Stretch">
			<property name="com.jaspersoft.studio.unit.height" value="px"/>
		</band>
	</summary>
</jasperReport>

', jasper_report_compilation='2023-12-14 19:26:31.285', application='', visible=true, supported_formats='PDF', data_source_type='jdbc', last_update='2024-01-05 19:54:06.964', "version"=2, last_user='DBeaver 22.2.2 - Main <first_in_line>'
WHERE id=82;
