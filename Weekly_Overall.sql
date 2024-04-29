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
	<style name="Top2" mode="Transparent" backcolor="#FFFFFF" pattern="">
		<conditionalStyle>
			<conditionExpression><![CDATA[1==1]]></conditionExpression>
			<style mode="Transparent" forecolor="#8FA3FF"/>
		</conditionalStyle>
	</style>
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
	<queryString>
		<![CDATA[select inbound_calls.start_date, inbound_calls.call_id as inbound_call_id, inbound_calls.surveyaccepted,flow_result_details.answer, flow_result_details.question_id,flow_result_details.answer_token,flow_results.* from inbound_calls
LEFT JOIN flow_results on inbound_calls.call_id = flow_results.request_id  or inbound_calls.call_id = flow_results.call_id
LEFT JOIN flow_result_details on flow_results.call_id = flow_result_details.call_id 
where $P!{where}
order by inbound_calls.call_id, question_id]]>
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
	<variable name="Accepted" class="java.lang.Integer" incrementType="Group" incrementGroup="Group1" calculation="Sum">
		<variableExpression><![CDATA[$F{surveyaccepted}?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="TotalDeclined" class="java.lang.Integer" incrementType="Group" incrementGroup="Group1" calculation="Sum">
		<variableExpression><![CDATA[$F{surveyaccepted}?0:1]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="TotalOffered" class="java.lang.Integer">
		<variableExpression><![CDATA[$V{TotalDeclined}+$V{Accepted}]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question1_response1" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q1v2") || $F{question_id}.equals("ssfcuag_sp_q1")) && $F{answer}.equals("1")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question1_response2" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q1v2") || $F{question_id}.equals("ssfcuag_sp_q1")) && $F{answer}.equals("2")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question1_response3" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q1v2") || $F{question_id}.equals("ssfcuag_sp_q1")) && $F{answer}.equals("3")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question1_response4" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q1v2") || $F{question_id}.equals("ssfcuag_sp_q1")) && $F{answer}.equals("4")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question1_response5" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q1v2") || $F{question_id}.equals("ssfcuag_sp_q1")) && $F{answer}.equals("5")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question2_response1" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q2v2") || $F{question_id}.equals("ssfcuag_sp_q2")) && $F{answer}.equals("1")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question2_response2" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q2v2") || $F{question_id}.equals("ssfcuag_sp_q2")) && $F{answer}.equals("2")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question2_response3" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q2v2") || $F{question_id}.equals("ssfcuag_sp_q2")) && $F{answer}.equals("3")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question2_response4" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q2v2") || $F{question_id}.equals("ssfcuag_sp_q2")) && $F{answer}.equals("4")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question2_response5" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q2v2") || $F{question_id}.equals("ssfcuag_sp_q2")) && $F{answer}.equals("5")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question3_response1" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q3v2") || $F{question_id}.equals("ssfcuag_sp_q3")) && $F{answer}.equals("1")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question3_response2" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q3v2") || $F{question_id}.equals("ssfcuag_sp_q3")) && $F{answer}.equals("2")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question3_response3" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q3v2") || $F{question_id}.equals("ssfcuag_sp_q3")) && $F{answer}.equals("3")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question3_response4" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q3v2") || $F{question_id}.equals("ssfcuag_sp_q3")) && $F{answer}.equals("4")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question3_response5" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q3v2") || $F{question_id}.equals("ssfcuag_sp_q3")) && $F{answer}.equals("5")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question4_response1" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q4v2") || $F{question_id}.equals("ssfcuag_sp_q4")) && $F{answer}.equals("1")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question4_response2" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q4v2") || $F{question_id}.equals("ssfcuag_sp_q4")) && $F{answer}.equals("2")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question4_response3" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q4v2") || $F{question_id}.equals("ssfcuag_sp_q4")) && $F{answer}.equals("3")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question4_response4" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q4v2") || $F{question_id}.equals("ssfcuag_sp_q4")) && $F{answer}.equals("4")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question4_response5" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q4v2") || $F{question_id}.equals("ssfcuag_sp_q4")) && $F{answer}.equals("5")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Answer" class="java.lang.String">
		<variableExpression><![CDATA[$F{answer}==null?"":$F{answer}]]></variableExpression>
	</variable>
	<variable name="response1" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[$F{question_id}.equals("ge_agent_sat_q1v2") && $F{answer}.equals("1")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="response2" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[$F{question_id}.equals("ge_agent_sat_q1v2") && $F{answer}.equals("2")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="response3" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[$F{question_id}.equals("ge_agent_sat_q1v2") && $F{answer}.equals("3")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="response4" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[$F{question_id}.equals("ge_agent_sat_q1v2") && $F{answer}.equals("4")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="response5" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[$F{question_id}.equals("ge_agent_sat_q1v2") && $F{answer}.equals("5")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="noresponse" class="java.lang.Integer"/>
	<variable name="Question1Count" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q1v2") ?1:0)]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question2Count" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q2v2") ?1:0)]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question3Count" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q3v2")  ?1:0)]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question4Count" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q4v2") ?1:0)]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question1_noResponse" class="java.lang.Integer">
		<variableExpression><![CDATA[$V{Question1Count}-($V{Question1_response1}+$V{Question1_response2}+$V{Question1_response3}+$V{Question1_response4}+$V{Question1_response5})]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question2_noResponse" class="java.lang.Integer">
		<variableExpression><![CDATA[$V{Question1Count}-($V{Question1_response1}+$V{Question1_response2}+$V{Question1_response3}+$V{Question1_response4}+$V{Question1_response5})]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question3_noResponse" class="java.lang.Integer">
		<variableExpression><![CDATA[$V{Question3Count}-($V{Question3_response1}+$V{Question3_response2}+$V{Question3_response3}+$V{Question3_response4}+$V{Question3_response5})]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question4_noResponse" class="java.lang.Integer">
		<variableExpression><![CDATA[$V{Question4Count}-($V{Question4_response1}+$V{Question4_response2}+$V{Question4_response3}+$V{Question4_response4}+$V{Question4_response5})]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question5Count" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q5v2") ?1:0)]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question5_noResponse" class="java.lang.Integer">
		<variableExpression><![CDATA[$V{Question5Count}-($V{Question5_response1}+$V{Question5_response2}+$V{Question5_response3}+$V{Question5_response4}+$V{Question5_response5})]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question5_response1" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q5v2") || $F{question_id}.equals("ssfcuag_sp_q5")) && $F{answer}.equals("1")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question5_response2" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q5v2") || $F{question_id}.equals("ssfcuag_sp_q5")) && $F{answer}.equals("2")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question5_response3" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q5v2") || $F{question_id}.equals("ssfcuag_sp_q5")) && $F{answer}.equals("3")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question5_response4" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q5v2") || $F{question_id}.equals("ssfcuag_sp_q5")) && $F{answer}.equals("4")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question5_response5" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q5v2") || $F{question_id}.equals("ssfcuag_sp_q5")) && $F{answer}.equals("5")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="AcceptedKey" class="java.lang.String">
		<variableExpression><![CDATA["Accepted "]]></variableExpression>
	</variable>
	<variable name="DeclinedKey" class="java.lang.String">
		<variableExpression><![CDATA["Declined"]]></variableExpression>
	</variable>
	<group name="Group1">
		<groupExpression><![CDATA[$F{inbound_call_id}]]></groupExpression>
	</group>
	<group name="CallId">
		<groupExpression><![CDATA[$F{inbound_call_id}]]></groupExpression>
	</group>
	<background>
		<band splitType="Stretch"/>
	</background>
	<summary>
		<band height="571" splitType="Stretch">
			<textField>
				<reportElement x="270" y="200" width="100" height="20" uuid="14f96290-058d-4d0a-a533-548af9376b48"/>
				<box padding="3">
					<topPen lineWidth="1.0"/>
					<leftPen lineWidth="1.0"/>
					<bottomPen lineWidth="1.0"/>
					<rightPen lineWidth="1.0"/>
				</box>
				<textFieldExpression><![CDATA[$V{TotalDeclined}]]></textFieldExpression>
			</textField>
			<textField>
				<reportElement x="270" y="160" width="100" height="20" uuid="aba7984d-f9ea-474a-b08c-2e4fb5e39887"/>
				<box padding="3">
					<topPen lineWidth="1.0"/>
					<leftPen lineWidth="1.0"/>
					<bottomPen lineWidth="1.0"/>
					<rightPen lineWidth="1.0"/>
				</box>
				<textFieldExpression><![CDATA[$V{TotalOffered}]]></textFieldExpression>
			</textField>
			<textField>
				<reportElement x="370" y="180" width="80" height="20" uuid="0648b7df-f96e-48c7-89a8-17fafce485a3"/>
				<box padding="3">
					<topPen lineWidth="1.0"/>
					<leftPen lineWidth="1.0"/>
					<bottomPen lineWidth="1.0"/>
					<rightPen lineWidth="1.0"/>
				</box>
				<textFieldExpression><![CDATA[$V{TotalOffered} > 0 ? String.format("%.0f%%",100.0*$V{Accepted}/$V{TotalOffered}):"NA"]]></textFieldExpression>
			</textField>
			<textField>
				<reportElement x="370" y="200" width="80" height="20" uuid="4453e6e5-b8d4-43e0-87f7-0371219e2013"/>
				<box padding="3">
					<topPen lineWidth="1.0"/>
					<leftPen lineWidth="1.0"/>
					<bottomPen lineWidth="1.0"/>
					<rightPen lineWidth="1.0"/>
				</box>
				<textFieldExpression><![CDATA[$V{TotalOffered} > 0 ? String.format("%.0f%%",100.0*$V{TotalDeclined}/$V{TotalOffered}):"NA"]]></textFieldExpression>
			</textField>
			<textField>
				<reportElement x="370" y="160" width="80" height="20" uuid="cd467feb-78d9-4449-ac15-24620338664b"/>
				<box padding="3">
					<topPen lineWidth="1.0"/>
					<leftPen lineWidth="1.0"/>
					<bottomPen lineWidth="1.0"/>
					<rightPen lineWidth="1.0"/>
				</box>
				<textFieldExpression><![CDATA[""]]></textFieldExpression>
			</textField>
			<textField>
				<reportElement x="110" y="160" width="160" height="20" uuid="37b38451-2427-4ba2-9c9c-0028384ebfd7"/>
				<box padding="3">
					<topPen lineWidth="1.0"/>
					<leftPen lineWidth="1.0"/>
					<bottomPen lineWidth="1.0"/>
					<rightPen lineWidth="1.0"/>
				</box>
				<textFieldExpression><![CDATA["Total Surveys Offered"]]></textFieldExpression>
			</textField>
			<textField>
				<reportElement x="270" y="180" width="100" height="20" uuid="b9655439-dfbf-4328-bda7-ca3637ceca72"/>
				<box padding="3">
					<topPen lineWidth="1.0"/>
					<leftPen lineWidth="1.0"/>
					<bottomPen lineWidth="1.0"/>
					<rightPen lineWidth="1.0"/>
				</box>
				<textFieldExpression><![CDATA[$V{Accepted}]]></textFieldExpression>
			</textField>
			<textField>
				<reportElement x="110" y="180" width="160" height="20" uuid="ae21887a-127f-429a-b7b0-190de86840ee"/>
				<box padding="3">
					<topPen lineWidth="1.0"/>
					<leftPen lineWidth="1.0"/>
					<bottomPen lineWidth="1.0"/>
					<rightPen lineWidth="1.0"/>
				</box>
				<textFieldExpression><![CDATA["Agent Surveys Accepted"]]></textFieldExpression>
			</textField>
			<textField>
				<reportElement x="110" y="200" width="160" height="20" uuid="6ccbf00d-9243-4b3e-b04e-6183e69882fe"/>
				<box padding="3">
					<topPen lineWidth="1.0"/>
					<leftPen lineWidth="1.0"/>
					<bottomPen lineWidth="1.0"/>
					<rightPen lineWidth="1.0"/>
				</box>
				<textFieldExpression><![CDATA["Total Surveys Declined"]]></textFieldExpression>
			</textField>
			<textField>
				<reportElement x="0" y="320" width="620" height="30" uuid="00207265-a66e-40c2-b82a-9decbe2ac7cf"/>
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
				<reportElement x="0" y="350" width="150" height="40" uuid="629e22f4-d351-444f-b3e2-01c93419b51a"/>
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
				<reportElement x="150" y="350" width="100" height="20" uuid="7b468315-60fa-420e-baf3-f440a0a652d3"/>
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
				<reportElement x="150" y="370" width="50" height="20" uuid="89a5fe1f-d6fa-42e6-ab90-5784a4d002de"/>
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
				<reportElement x="200" y="370" width="50" height="20" uuid="6fb21505-0d13-44d2-9c9a-2068989899f0"/>
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
				<reportElement x="250" y="370" width="50" height="20" uuid="ee97be11-fdb1-4a69-8dc2-97f5c3b1638b"/>
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
				<reportElement x="250" y="350" width="100" height="20" uuid="32af33ec-347f-4c32-8b6d-b8d43a7bca68"/>
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
				<reportElement x="300" y="370" width="50" height="20" uuid="95d7bec5-9f00-46bd-ab27-6bf31b8e43bf"/>
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
				<reportElement x="350" y="370" width="50" height="20" uuid="493c56d1-cd11-479f-911b-750a38eb9b2d"/>
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
				<reportElement x="350" y="350" width="100" height="20" uuid="47aa1719-6a7b-4779-a636-2d3f37b0fc2c"/>
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
				<reportElement x="400" y="370" width="50" height="20" uuid="05cfb6d1-ccb7-4ae0-86c0-be6f85737f13"/>
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
				<reportElement x="0" y="390" width="150" height="30" uuid="46dd3751-3af6-42b4-9c73-35689a508873"/>
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
				<reportElement x="0" y="420" width="150" height="30" uuid="96fe834c-510b-4a28-9c58-2402b3288b0a"/>
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
				<reportElement x="0" y="450" width="150" height="30" uuid="d8196c1d-51a2-4f4e-be6b-45bd92657505"/>
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
				<reportElement x="0" y="480" width="150" height="30" uuid="e974b0cc-425e-4e6e-89e7-6383a1456696"/>
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
				<reportElement x="110" y="140" width="340" height="20" uuid="e1a60bfc-754b-4200-b38a-48ddfe817dbc"/>
				<box padding="3">
					<topPen lineWidth="1.0"/>
					<leftPen lineWidth="1.0"/>
					<bottomPen lineWidth="1.0"/>
					<rightPen lineWidth="1.0"/>
				</box>
				<textElement textAlignment="Center" verticalAlignment="Middle"/>
				<textFieldExpression><![CDATA["Agent Survey"]]></textFieldExpression>
			</textField>
			<textField>
				<reportElement x="520" y="350" width="100" height="40" uuid="64b8c9c5-93e7-44e9-a894-e6f76dd900fe"/>
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
				<reportElement x="0" y="0" width="850" height="40" uuid="841389ec-dfc6-45a1-b9b0-2d3c470dee29">
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
				<textFieldExpression><![CDATA["Weekly Overall Agent Satisfaction Survey"]]></textFieldExpression>
			</textField>
			<textField>
				<reportElement x="0" y="510" width="150" height="30" uuid="4e70eb22-1448-4816-878e-ed273dc470ea"/>
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
				<reportElement x="300" y="390" width="50" height="30" uuid="bbd0d0b0-d9f3-4611-bebc-368614e001f0"/>
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
				<reportElement x="350" y="390" width="50" height="30" uuid="dfb6f956-8d44-425d-bc8f-18277d230aff"/>
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
				<reportElement x="300" y="420" width="50" height="30" uuid="cf14cc54-06ad-44ca-9001-f928b2401f40"/>
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
				<reportElement x="350" y="420" width="50" height="30" uuid="23879f7d-bd67-4245-8b4b-7be3afc8b8f9"/>
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
				<reportElement x="200" y="450" width="50" height="30" uuid="235e1efb-38bd-484b-ac39-603ae08b0679"/>
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
				<reportElement x="200" y="480" width="50" height="30" uuid="20e57388-0700-4127-bc25-f3564f0a1800"/>
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
				<reportElement x="350" y="450" width="50" height="30" uuid="45255877-5e5a-4860-ba24-dd17198f9891"/>
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
				<reportElement x="250" y="390" width="50" height="30" uuid="1fe789d4-17e5-43a4-8540-255f86e94c14"/>
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
				<reportElement x="150" y="480" width="50" height="30" uuid="a7eabcc4-1c6c-4a15-baf2-3e296b7b6c13"/>
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
				<reportElement x="250" y="420" width="50" height="30" uuid="6f03ef9e-c9ab-4938-9ead-b0c060d60f9a"/>
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
				<reportElement x="350" y="480" width="50" height="30" uuid="542c735a-ec54-440d-a4ae-cc1033797219"/>
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
				<reportElement x="520" y="390" width="100" height="30" uuid="0faf342a-3778-4f97-b740-fcb67be01358"/>
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
				<reportElement x="250" y="450" width="50" height="30" uuid="a296a1a7-aaee-40db-a977-bab315a835aa"/>
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
				<reportElement x="400" y="480" width="50" height="30" uuid="58864b4c-eadc-443f-9a55-0667abfd2de1"/>
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
				<reportElement x="520" y="450" width="100" height="30" uuid="702e747c-da35-422a-ae39-81d0f5e13255"/>
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
				<reportElement x="150" y="420" width="50" height="30" uuid="19a8aea0-33b0-4273-ac95-74070a8d45fc"/>
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
				<reportElement x="400" y="420" width="50" height="30" uuid="cd31f937-2521-4ac0-8033-142f5053fad7"/>
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
				<reportElement key="" x="150" y="390" width="50" height="30" uuid="dcf95dd7-7bf5-4195-99e9-bce018a39938"/>
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
				<reportElement x="400" y="390" width="50" height="30" uuid="82908891-568d-48b8-b7dd-a6ad3598cc95"/>
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
				<reportElement x="520" y="480" width="100" height="30" uuid="dfcb8655-8184-43d3-9ba3-80836ac73d85"/>
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
				<reportElement x="520" y="420" width="100" height="30" uuid="7f33a64f-cc62-495e-bd8e-06a7f3ea727c"/>
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
				<reportElement x="150" y="450" width="50" height="30" uuid="a67ee508-2160-4db0-a58d-2da09e58d1fb"/>
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
				<reportElement x="300" y="450" width="50" height="30" uuid="1e2a30c8-40b7-4788-970f-7d59057086a2"/>
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
				<reportElement x="250" y="480" width="50" height="30" uuid="deffbacf-9d8b-4531-b27d-9593fdb6cb78"/>
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
				<reportElement x="400" y="450" width="50" height="30" uuid="e9990fa5-fed0-49f4-9940-c3fcd91dff2a"/>
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
				<reportElement x="200" y="390" width="50" height="30" uuid="c072a29e-6ed0-48d6-85b7-d773c5142dad"/>
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
				<reportElement x="200" y="420" width="50" height="30" uuid="6c248158-dca3-44da-9f26-c3737fa55ee1"/>
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
				<reportElement x="300" y="480" width="50" height="30" uuid="5e07da61-ce87-4234-8a23-9a5f3ae9ec9e"/>
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
				<reportElement x="250" y="510" width="50" height="30" uuid="4bab1579-ea1e-4d12-878c-083662a9d2c2"/>
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
				<reportElement x="200" y="510" width="50" height="30" uuid="e34d1522-f9af-4d22-a389-c82dbc5dfc11"/>
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
				<reportElement x="400" y="510" width="50" height="30" uuid="9c068e2f-5bd3-46a8-92fa-88973f9a94ce"/>
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
				<reportElement x="150" y="510" width="50" height="30" uuid="52580d36-1f05-497d-83eb-3e37ff895b66"/>
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
				<reportElement x="300" y="510" width="50" height="30" uuid="07c573c2-10a1-4417-b89c-ce7bf24d9f51"/>
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
				<reportElement x="350" y="510" width="50" height="30" uuid="76f41ee6-bf7e-43a7-936e-4aba37096c39"/>
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
				<reportElement x="520" y="510" width="100" height="30" uuid="c6bfd6e4-e945-403f-9168-f8d06167965c"/>
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
				<reportElement x="500" y="39" width="349" height="21" uuid="ca0e71f3-8ce9-4938-b848-83d924293a14"/>
				<textElement textAlignment="Right" verticalAlignment="Middle">
					<font size="11"/>
				</textElement>
				<textFieldExpression><![CDATA[$P{SubTitle}]]></textFieldExpression>
			</textField>
			<image>
				<reportElement x="0" y="0" width="300" height="50" uuid="5dc00238-836f-4b09-a643-aa665ef21927"/>
				<imageExpression><![CDATA[$P{REPORT_MGR_BASE} +"/GetImage?image=swampfox_logo"]]></imageExpression>
			</image>
			<textField>
				<reportElement x="450" y="350" width="70" height="40" uuid="39e9d288-8795-4fc3-b1c0-85646e0bf519"/>
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
				<reportElement x="450" y="390" width="70" height="30" forecolor="#757575" uuid="3430cf02-a46c-4671-8ae9-44aca026f3f6"/>
				<box>
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
				<reportElement x="450" y="420" width="70" height="30" forecolor="#757575" uuid="1b063e93-768f-4333-a469-65f9a6b3bc38"/>
				<box>
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
				<reportElement x="450" y="450" width="70" height="30" forecolor="#757575" uuid="c2c6d6b8-33df-40ba-9e60-8f51efedf929"/>
				<box>
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
				<reportElement x="450" y="510" width="70" height="30" forecolor="#757575" uuid="d7203117-15a9-4f39-8ed4-e3fafc4a706c"/>
				<box>
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
				<reportElement x="680" y="360" width="180" height="20" uuid="fffe9f1f-5875-49e7-a26b-15eb04ce2cd7"/>
				<box>
					<topPen lineWidth="1.0"/>
					<leftPen lineWidth="1.0"/>
					<bottomPen lineWidth="1.0"/>
					<rightPen lineWidth="1.0"/>
				</box>
				<textElement textAlignment="Center" verticalAlignment="Middle">
					<font isBold="true"/>
				</textElement>
				<textFieldExpression><![CDATA["Overall Average Agent Rating"]]></textFieldExpression>
			</textField>
			<textField pattern="#,##0.0000;(#,##0.0000-)">
				<reportElement x="680" y="380" width="180" height="30" uuid="a2320ae0-6e5e-403c-b28d-3208f40e3aff"/>
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
				<reportElement x="450" y="480" width="70" height="30" forecolor="#757575" uuid="114c3d8a-89e3-45e3-9d3c-1a087d3f471a"/>
				<box>
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
			<pieChart>
				<chart evaluationTime="Report">
					<reportElement x="480" y="60" width="340" height="240" uuid="9cba0a09-eb12-4334-8229-a1bf2efae7e5"/>
					<chartTitle/>
					<chartSubtitle/>
					<chartLegend/>
				</chart>
				<pieDataset maxCount="2">
					<dataset incrementType="Group" incrementGroup="CallId"/>
					<pieSeries>
						<keyExpression><![CDATA[$V{AcceptedKey}]]></keyExpression>
						<valueExpression><![CDATA[$V{Accepted}]]></valueExpression>
						<labelExpression><![CDATA["Accepted"]]></labelExpression>
					</pieSeries>
					<pieSeries>
						<keyExpression><![CDATA[$V{DeclinedKey}]]></keyExpression>
						<valueExpression><![CDATA[$V{TotalDeclined}]]></valueExpression>
						<labelExpression><![CDATA["Declined"]]></labelExpression>
					</pieSeries>
				</pieDataset>
				<piePlot>
					<plot/>
					<itemLabel/>
				</piePlot>
			</pieChart>
		</band>
	</summary>
	<noData>
		<band height="120">
			<image>
				<reportElement x="0" y="0" width="300" height="50" uuid="df990c7e-f14a-4198-a191-63960ca6d773"/>
				<imageExpression><![CDATA[$P{REPORT_MGR_BASE} +"/GetImage?image=swampfox_logo"]]></imageExpression>
			</image>
			<textField>
				<reportElement x="500" y="39" width="349" height="21" uuid="2d263199-80a8-4406-adbd-ce55f9f0b83f"/>
				<textElement textAlignment="Right" verticalAlignment="Middle">
					<font size="11"/>
				</textElement>
				<textFieldExpression><![CDATA[$P{SubTitle}]]></textFieldExpression>
			</textField>
			<textField>
				<reportElement x="0" y="0" width="850" height="40" uuid="6993f3b6-3de4-4b02-80f5-2278af0e0d19">
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
				<textFieldExpression><![CDATA["Agent Satisfaction Survey"]]></textFieldExpression>
			</textField>
			<textField>
				<reportElement x="0" y="80" width="860" height="40" uuid="f93d0136-020e-4264-aa3c-9fa375fade24">
					<property name="local_mesure_unitx" value="pixel"/>
					<property name="com.jaspersoft.studio.unit.x" value="px"/>
					<property name="local_mesure_unitwidth" value="pixel"/>
					<property name="com.jaspersoft.studio.unit.width" value="px"/>
					<property name="local_mesure_unitheight" value="pixel"/>
					<property name="com.jaspersoft.studio.unit.height" value="px"/>
				</reportElement>
				<textElement textAlignment="Center" verticalAlignment="Middle">
					<font fontName="Times New Roman" size="16"/>
				</textElement>
				<textFieldExpression><![CDATA["No results found."]]></textFieldExpression>
			</textField>
		</band>
	</noData>
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
	<style name="Top2" mode="Transparent" backcolor="#FFFFFF" pattern="">
		<conditionalStyle>
			<conditionExpression><![CDATA[1==1]]></conditionExpression>
			<style mode="Transparent" forecolor="#8FA3FF"/>
		</conditionalStyle>
	</style>
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
	<queryString>
		<![CDATA[select inbound_calls.start_date, inbound_calls.call_id as inbound_call_id, inbound_calls.surveyaccepted,flow_result_details.answer, flow_result_details.question_id,flow_result_details.answer_token,flow_results.* from inbound_calls
LEFT JOIN flow_results on inbound_calls.call_id = flow_results.request_id  or inbound_calls.call_id = flow_results.call_id
LEFT JOIN flow_result_details on flow_results.call_id = flow_result_details.call_id 
where $P!{where}
order by inbound_calls.call_id, question_id]]>
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
	<variable name="Accepted" class="java.lang.Integer" incrementType="Group" incrementGroup="Group1" calculation="Sum">
		<variableExpression><![CDATA[$F{surveyaccepted}?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="TotalDeclined" class="java.lang.Integer" incrementType="Group" incrementGroup="Group1" calculation="Sum">
		<variableExpression><![CDATA[$F{surveyaccepted}?0:1]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="TotalOffered" class="java.lang.Integer">
		<variableExpression><![CDATA[$V{TotalDeclined}+$V{Accepted}]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question1_response1" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q1v2") || $F{question_id}.equals("ssfcuag_sp_q1")) && $F{answer}.equals("1")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question1_response2" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q1v2") || $F{question_id}.equals("ssfcuag_sp_q1")) && $F{answer}.equals("2")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question1_response3" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q1v2") || $F{question_id}.equals("ssfcuag_sp_q1")) && $F{answer}.equals("3")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question1_response4" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q1v2") || $F{question_id}.equals("ssfcuag_sp_q1")) && $F{answer}.equals("4")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question1_response5" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q1v2") || $F{question_id}.equals("ssfcuag_sp_q1")) && $F{answer}.equals("5")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question2_response1" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q2v2") || $F{question_id}.equals("ssfcuag_sp_q2")) && $F{answer}.equals("1")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question2_response2" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q2v2") || $F{question_id}.equals("ssfcuag_sp_q2")) && $F{answer}.equals("2")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question2_response3" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q2v2") || $F{question_id}.equals("ssfcuag_sp_q2")) && $F{answer}.equals("3")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question2_response4" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q2v2") || $F{question_id}.equals("ssfcuag_sp_q2")) && $F{answer}.equals("4")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question2_response5" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q2v2") || $F{question_id}.equals("ssfcuag_sp_q2")) && $F{answer}.equals("5")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question3_response1" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q3v2") || $F{question_id}.equals("ssfcuag_sp_q3")) && $F{answer}.equals("1")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question3_response2" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q3v2") || $F{question_id}.equals("ssfcuag_sp_q3")) && $F{answer}.equals("2")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question3_response3" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q3v2") || $F{question_id}.equals("ssfcuag_sp_q3")) && $F{answer}.equals("3")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question3_response4" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q3v2") || $F{question_id}.equals("ssfcuag_sp_q3")) && $F{answer}.equals("4")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question3_response5" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q3v2") || $F{question_id}.equals("ssfcuag_sp_q3")) && $F{answer}.equals("5")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question4_response1" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q4v2") || $F{question_id}.equals("ssfcuag_sp_q4")) && $F{answer}.equals("1")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question4_response2" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q4v2") || $F{question_id}.equals("ssfcuag_sp_q4")) && $F{answer}.equals("2")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question4_response3" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q4v2") || $F{question_id}.equals("ssfcuag_sp_q4")) && $F{answer}.equals("3")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question4_response4" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q4v2") || $F{question_id}.equals("ssfcuag_sp_q4")) && $F{answer}.equals("4")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question4_response5" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q4v2") || $F{question_id}.equals("ssfcuag_sp_q4")) && $F{answer}.equals("5")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Answer" class="java.lang.String">
		<variableExpression><![CDATA[$F{answer}==null?"":$F{answer}]]></variableExpression>
	</variable>
	<variable name="response1" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[$F{question_id}.equals("ge_agent_sat_q1v2") && $F{answer}.equals("1")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="response2" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[$F{question_id}.equals("ge_agent_sat_q1v2") && $F{answer}.equals("2")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="response3" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[$F{question_id}.equals("ge_agent_sat_q1v2") && $F{answer}.equals("3")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="response4" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[$F{question_id}.equals("ge_agent_sat_q1v2") && $F{answer}.equals("4")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="response5" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[$F{question_id}.equals("ge_agent_sat_q1v2") && $F{answer}.equals("5")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="noresponse" class="java.lang.Integer"/>
	<variable name="Question1Count" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q1v2") ?1:0)]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question2Count" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q2v2") ?1:0)]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question3Count" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q3v2")  ?1:0)]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question4Count" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q4v2") ?1:0)]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question1_noResponse" class="java.lang.Integer">
		<variableExpression><![CDATA[$V{Question1Count}-($V{Question1_response1}+$V{Question1_response2}+$V{Question1_response3}+$V{Question1_response4}+$V{Question1_response5})]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question2_noResponse" class="java.lang.Integer">
		<variableExpression><![CDATA[$V{Question1Count}-($V{Question1_response1}+$V{Question1_response2}+$V{Question1_response3}+$V{Question1_response4}+$V{Question1_response5})]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question3_noResponse" class="java.lang.Integer">
		<variableExpression><![CDATA[$V{Question3Count}-($V{Question3_response1}+$V{Question3_response2}+$V{Question3_response3}+$V{Question3_response4}+$V{Question3_response5})]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question4_noResponse" class="java.lang.Integer">
		<variableExpression><![CDATA[$V{Question4Count}-($V{Question4_response1}+$V{Question4_response2}+$V{Question4_response3}+$V{Question4_response4}+$V{Question4_response5})]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question5Count" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q5v2") ?1:0)]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question5_noResponse" class="java.lang.Integer">
		<variableExpression><![CDATA[$V{Question5Count}-($V{Question5_response1}+$V{Question5_response2}+$V{Question5_response3}+$V{Question5_response4}+$V{Question5_response5})]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question5_response1" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q5v2") || $F{question_id}.equals("ssfcuag_sp_q5")) && $F{answer}.equals("1")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question5_response2" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q5v2") || $F{question_id}.equals("ssfcuag_sp_q5")) && $F{answer}.equals("2")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question5_response3" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q5v2") || $F{question_id}.equals("ssfcuag_sp_q5")) && $F{answer}.equals("3")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question5_response4" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q5v2") || $F{question_id}.equals("ssfcuag_sp_q5")) && $F{answer}.equals("4")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="Question5_response5" class="java.lang.Integer" calculation="Sum">
		<variableExpression><![CDATA[($F{question_id}.equals("ge_agent_sat_q5v2") || $F{question_id}.equals("ssfcuag_sp_q5")) && $F{answer}.equals("5")?1:0]]></variableExpression>
		<initialValueExpression><![CDATA[new Integer(0)]]></initialValueExpression>
	</variable>
	<variable name="AcceptedKey" class="java.lang.String">
		<variableExpression><![CDATA["Accepted "]]></variableExpression>
	</variable>
	<variable name="DeclinedKey" class="java.lang.String">
		<variableExpression><![CDATA["Declined"]]></variableExpression>
	</variable>
	<group name="Group1">
		<groupExpression><![CDATA[$F{inbound_call_id}]]></groupExpression>
	</group>
	<group name="CallId">
		<groupExpression><![CDATA[$F{inbound_call_id}]]></groupExpression>
	</group>
	<background>
		<band splitType="Stretch"/>
	</background>
	<summary>
		<band height="571" splitType="Stretch">
			<textField>
				<reportElement x="270" y="200" width="100" height="20" uuid="14f96290-058d-4d0a-a533-548af9376b48"/>
				<box padding="3">
					<topPen lineWidth="1.0"/>
					<leftPen lineWidth="1.0"/>
					<bottomPen lineWidth="1.0"/>
					<rightPen lineWidth="1.0"/>
				</box>
				<textFieldExpression><![CDATA[$V{TotalDeclined}]]></textFieldExpression>
			</textField>
			<textField>
				<reportElement x="270" y="160" width="100" height="20" uuid="aba7984d-f9ea-474a-b08c-2e4fb5e39887"/>
				<box padding="3">
					<topPen lineWidth="1.0"/>
					<leftPen lineWidth="1.0"/>
					<bottomPen lineWidth="1.0"/>
					<rightPen lineWidth="1.0"/>
				</box>
				<textFieldExpression><![CDATA[$V{TotalOffered}]]></textFieldExpression>
			</textField>
			<textField>
				<reportElement x="370" y="180" width="80" height="20" uuid="0648b7df-f96e-48c7-89a8-17fafce485a3"/>
				<box padding="3">
					<topPen lineWidth="1.0"/>
					<leftPen lineWidth="1.0"/>
					<bottomPen lineWidth="1.0"/>
					<rightPen lineWidth="1.0"/>
				</box>
				<textFieldExpression><![CDATA[$V{TotalOffered} > 0 ? String.format("%.0f%%",100.0*$V{Accepted}/$V{TotalOffered}):"NA"]]></textFieldExpression>
			</textField>
			<textField>
				<reportElement x="370" y="200" width="80" height="20" uuid="4453e6e5-b8d4-43e0-87f7-0371219e2013"/>
				<box padding="3">
					<topPen lineWidth="1.0"/>
					<leftPen lineWidth="1.0"/>
					<bottomPen lineWidth="1.0"/>
					<rightPen lineWidth="1.0"/>
				</box>
				<textFieldExpression><![CDATA[$V{TotalOffered} > 0 ? String.format("%.0f%%",100.0*$V{TotalDeclined}/$V{TotalOffered}):"NA"]]></textFieldExpression>
			</textField>
			<textField>
				<reportElement x="370" y="160" width="80" height="20" uuid="cd467feb-78d9-4449-ac15-24620338664b"/>
				<box padding="3">
					<topPen lineWidth="1.0"/>
					<leftPen lineWidth="1.0"/>
					<bottomPen lineWidth="1.0"/>
					<rightPen lineWidth="1.0"/>
				</box>
				<textFieldExpression><![CDATA[""]]></textFieldExpression>
			</textField>
			<textField>
				<reportElement x="110" y="160" width="160" height="20" uuid="37b38451-2427-4ba2-9c9c-0028384ebfd7"/>
				<box padding="3">
					<topPen lineWidth="1.0"/>
					<leftPen lineWidth="1.0"/>
					<bottomPen lineWidth="1.0"/>
					<rightPen lineWidth="1.0"/>
				</box>
				<textFieldExpression><![CDATA["Total Surveys Offered"]]></textFieldExpression>
			</textField>
			<textField>
				<reportElement x="270" y="180" width="100" height="20" uuid="b9655439-dfbf-4328-bda7-ca3637ceca72"/>
				<box padding="3">
					<topPen lineWidth="1.0"/>
					<leftPen lineWidth="1.0"/>
					<bottomPen lineWidth="1.0"/>
					<rightPen lineWidth="1.0"/>
				</box>
				<textFieldExpression><![CDATA[$V{Accepted}]]></textFieldExpression>
			</textField>
			<textField>
				<reportElement x="110" y="180" width="160" height="20" uuid="ae21887a-127f-429a-b7b0-190de86840ee"/>
				<box padding="3">
					<topPen lineWidth="1.0"/>
					<leftPen lineWidth="1.0"/>
					<bottomPen lineWidth="1.0"/>
					<rightPen lineWidth="1.0"/>
				</box>
				<textFieldExpression><![CDATA["Agent Surveys Accepted"]]></textFieldExpression>
			</textField>
			<textField>
				<reportElement x="110" y="200" width="160" height="20" uuid="6ccbf00d-9243-4b3e-b04e-6183e69882fe"/>
				<box padding="3">
					<topPen lineWidth="1.0"/>
					<leftPen lineWidth="1.0"/>
					<bottomPen lineWidth="1.0"/>
					<rightPen lineWidth="1.0"/>
				</box>
				<textFieldExpression><![CDATA["Total Surveys Declined"]]></textFieldExpression>
			</textField>
			<textField>
				<reportElement x="0" y="320" width="620" height="30" uuid="00207265-a66e-40c2-b82a-9decbe2ac7cf"/>
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
				<reportElement x="0" y="350" width="150" height="40" uuid="629e22f4-d351-444f-b3e2-01c93419b51a"/>
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
				<reportElement x="150" y="350" width="100" height="20" uuid="7b468315-60fa-420e-baf3-f440a0a652d3"/>
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
				<reportElement x="150" y="370" width="50" height="20" uuid="89a5fe1f-d6fa-42e6-ab90-5784a4d002de"/>
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
				<reportElement x="200" y="370" width="50" height="20" uuid="6fb21505-0d13-44d2-9c9a-2068989899f0"/>
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
				<reportElement x="250" y="370" width="50" height="20" uuid="ee97be11-fdb1-4a69-8dc2-97f5c3b1638b"/>
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
				<reportElement x="250" y="350" width="100" height="20" uuid="32af33ec-347f-4c32-8b6d-b8d43a7bca68"/>
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
				<reportElement x="300" y="370" width="50" height="20" uuid="95d7bec5-9f00-46bd-ab27-6bf31b8e43bf"/>
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
				<reportElement x="350" y="370" width="50" height="20" uuid="493c56d1-cd11-479f-911b-750a38eb9b2d"/>
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
				<reportElement x="350" y="350" width="100" height="20" uuid="47aa1719-6a7b-4779-a636-2d3f37b0fc2c"/>
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
				<reportElement x="400" y="370" width="50" height="20" uuid="05cfb6d1-ccb7-4ae0-86c0-be6f85737f13"/>
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
				<reportElement x="0" y="390" width="150" height="30" uuid="46dd3751-3af6-42b4-9c73-35689a508873"/>
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
				<reportElement x="0" y="420" width="150" height="30" uuid="96fe834c-510b-4a28-9c58-2402b3288b0a"/>
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
				<reportElement x="0" y="450" width="150" height="30" uuid="d8196c1d-51a2-4f4e-be6b-45bd92657505"/>
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
				<reportElement x="0" y="480" width="150" height="30" uuid="e974b0cc-425e-4e6e-89e7-6383a1456696"/>
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
				<reportElement x="110" y="140" width="340" height="20" uuid="e1a60bfc-754b-4200-b38a-48ddfe817dbc"/>
				<box padding="3">
					<topPen lineWidth="1.0"/>
					<leftPen lineWidth="1.0"/>
					<bottomPen lineWidth="1.0"/>
					<rightPen lineWidth="1.0"/>
				</box>
				<textElement textAlignment="Center" verticalAlignment="Middle"/>
				<textFieldExpression><![CDATA["Agent Survey"]]></textFieldExpression>
			</textField>
			<textField>
				<reportElement x="520" y="350" width="100" height="40" uuid="64b8c9c5-93e7-44e9-a894-e6f76dd900fe"/>
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
				<reportElement x="0" y="0" width="850" height="40" uuid="841389ec-dfc6-45a1-b9b0-2d3c470dee29">
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
				<textFieldExpression><![CDATA["Weekly Overall Agent Satisfaction Survey"]]></textFieldExpression>
			</textField>
			<textField>
				<reportElement x="0" y="510" width="150" height="30" uuid="4e70eb22-1448-4816-878e-ed273dc470ea"/>
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
				<reportElement x="300" y="390" width="50" height="30" uuid="bbd0d0b0-d9f3-4611-bebc-368614e001f0"/>
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
				<reportElement x="350" y="390" width="50" height="30" uuid="dfb6f956-8d44-425d-bc8f-18277d230aff"/>
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
				<reportElement x="300" y="420" width="50" height="30" uuid="cf14cc54-06ad-44ca-9001-f928b2401f40"/>
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
				<reportElement x="350" y="420" width="50" height="30" uuid="23879f7d-bd67-4245-8b4b-7be3afc8b8f9"/>
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
				<reportElement x="200" y="450" width="50" height="30" uuid="235e1efb-38bd-484b-ac39-603ae08b0679"/>
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
				<reportElement x="200" y="480" width="50" height="30" uuid="20e57388-0700-4127-bc25-f3564f0a1800"/>
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
				<reportElement x="350" y="450" width="50" height="30" uuid="45255877-5e5a-4860-ba24-dd17198f9891"/>
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
				<reportElement x="250" y="390" width="50" height="30" uuid="1fe789d4-17e5-43a4-8540-255f86e94c14"/>
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
				<reportElement x="150" y="480" width="50" height="30" uuid="a7eabcc4-1c6c-4a15-baf2-3e296b7b6c13"/>
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
				<reportElement x="250" y="420" width="50" height="30" uuid="6f03ef9e-c9ab-4938-9ead-b0c060d60f9a"/>
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
				<reportElement x="350" y="480" width="50" height="30" uuid="542c735a-ec54-440d-a4ae-cc1033797219"/>
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
				<reportElement x="520" y="390" width="100" height="30" uuid="0faf342a-3778-4f97-b740-fcb67be01358"/>
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
				<reportElement x="250" y="450" width="50" height="30" uuid="a296a1a7-aaee-40db-a977-bab315a835aa"/>
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
				<reportElement x="400" y="480" width="50" height="30" uuid="58864b4c-eadc-443f-9a55-0667abfd2de1"/>
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
				<reportElement x="520" y="450" width="100" height="30" uuid="702e747c-da35-422a-ae39-81d0f5e13255"/>
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
				<reportElement x="150" y="420" width="50" height="30" uuid="19a8aea0-33b0-4273-ac95-74070a8d45fc"/>
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
				<reportElement x="400" y="420" width="50" height="30" uuid="cd31f937-2521-4ac0-8033-142f5053fad7"/>
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
				<reportElement key="" x="150" y="390" width="50" height="30" uuid="dcf95dd7-7bf5-4195-99e9-bce018a39938"/>
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
				<reportElement x="400" y="390" width="50" height="30" uuid="82908891-568d-48b8-b7dd-a6ad3598cc95"/>
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
				<reportElement x="520" y="480" width="100" height="30" uuid="dfcb8655-8184-43d3-9ba3-80836ac73d85"/>
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
				<reportElement x="520" y="420" width="100" height="30" uuid="7f33a64f-cc62-495e-bd8e-06a7f3ea727c"/>
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
				<reportElement x="150" y="450" width="50" height="30" uuid="a67ee508-2160-4db0-a58d-2da09e58d1fb"/>
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
				<reportElement x="300" y="450" width="50" height="30" uuid="1e2a30c8-40b7-4788-970f-7d59057086a2"/>
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
				<reportElement x="250" y="480" width="50" height="30" uuid="deffbacf-9d8b-4531-b27d-9593fdb6cb78"/>
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
				<reportElement x="400" y="450" width="50" height="30" uuid="e9990fa5-fed0-49f4-9940-c3fcd91dff2a"/>
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
				<reportElement x="200" y="390" width="50" height="30" uuid="c072a29e-6ed0-48d6-85b7-d773c5142dad"/>
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
				<reportElement x="200" y="420" width="50" height="30" uuid="6c248158-dca3-44da-9f26-c3737fa55ee1"/>
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
				<reportElement x="300" y="480" width="50" height="30" uuid="5e07da61-ce87-4234-8a23-9a5f3ae9ec9e"/>
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
				<reportElement x="250" y="510" width="50" height="30" uuid="4bab1579-ea1e-4d12-878c-083662a9d2c2"/>
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
				<reportElement x="200" y="510" width="50" height="30" uuid="e34d1522-f9af-4d22-a389-c82dbc5dfc11"/>
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
				<reportElement x="400" y="510" width="50" height="30" uuid="9c068e2f-5bd3-46a8-92fa-88973f9a94ce"/>
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
				<reportElement x="150" y="510" width="50" height="30" uuid="52580d36-1f05-497d-83eb-3e37ff895b66"/>
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
				<reportElement x="300" y="510" width="50" height="30" uuid="07c573c2-10a1-4417-b89c-ce7bf24d9f51"/>
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
				<reportElement x="350" y="510" width="50" height="30" uuid="76f41ee6-bf7e-43a7-936e-4aba37096c39"/>
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
				<reportElement x="520" y="510" width="100" height="30" uuid="c6bfd6e4-e945-403f-9168-f8d06167965c"/>
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
				<reportElement x="500" y="39" width="349" height="21" uuid="ca0e71f3-8ce9-4938-b848-83d924293a14"/>
				<textElement textAlignment="Right" verticalAlignment="Middle">
					<font size="11"/>
				</textElement>
				<textFieldExpression><![CDATA[$P{SubTitle}]]></textFieldExpression>
			</textField>
			<image>
				<reportElement x="0" y="0" width="300" height="50" uuid="5dc00238-836f-4b09-a643-aa665ef21927"/>
				<imageExpression><![CDATA[$P{REPORT_MGR_BASE} +"/GetImage?image=swampfox_logo"]]></imageExpression>
			</image>
			<textField>
				<reportElement x="450" y="350" width="70" height="40" uuid="39e9d288-8795-4fc3-b1c0-85646e0bf519"/>
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
				<reportElement x="450" y="390" width="70" height="30" forecolor="#757575" uuid="3430cf02-a46c-4671-8ae9-44aca026f3f6"/>
				<box>
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
				<reportElement x="450" y="420" width="70" height="30" forecolor="#757575" uuid="1b063e93-768f-4333-a469-65f9a6b3bc38"/>
				<box>
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
				<reportElement x="450" y="450" width="70" height="30" forecolor="#757575" uuid="c2c6d6b8-33df-40ba-9e60-8f51efedf929"/>
				<box>
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
				<reportElement x="450" y="510" width="70" height="30" forecolor="#757575" uuid="d7203117-15a9-4f39-8ed4-e3fafc4a706c"/>
				<box>
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
				<reportElement x="680" y="360" width="180" height="20" uuid="fffe9f1f-5875-49e7-a26b-15eb04ce2cd7"/>
				<box>
					<topPen lineWidth="1.0"/>
					<leftPen lineWidth="1.0"/>
					<bottomPen lineWidth="1.0"/>
					<rightPen lineWidth="1.0"/>
				</box>
				<textElement textAlignment="Center" verticalAlignment="Middle">
					<font isBold="true"/>
				</textElement>
				<textFieldExpression><![CDATA["Overall Average Agent Rating"]]></textFieldExpression>
			</textField>
			<textField pattern="#,##0.0000;(#,##0.0000-)">
				<reportElement x="680" y="380" width="180" height="30" uuid="a2320ae0-6e5e-403c-b28d-3208f40e3aff"/>
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
				<reportElement x="450" y="480" width="70" height="30" forecolor="#757575" uuid="114c3d8a-89e3-45e3-9d3c-1a087d3f471a"/>
				<box>
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
			<pieChart>
				<chart evaluationTime="Report">
					<reportElement x="480" y="60" width="340" height="240" uuid="9cba0a09-eb12-4334-8229-a1bf2efae7e5"/>
					<chartTitle/>
					<chartSubtitle/>
					<chartLegend/>
				</chart>
				<pieDataset maxCount="2">
					<dataset incrementType="Group" incrementGroup="CallId"/>
					<pieSeries>
						<keyExpression><![CDATA[$V{AcceptedKey}]]></keyExpression>
						<valueExpression><![CDATA[$V{Accepted}]]></valueExpression>
						<labelExpression><![CDATA["Accepted"]]></labelExpression>
					</pieSeries>
					<pieSeries>
						<keyExpression><![CDATA[$V{DeclinedKey}]]></keyExpression>
						<valueExpression><![CDATA[$V{TotalDeclined}]]></valueExpression>
						<labelExpression><![CDATA["Declined"]]></labelExpression>
					</pieSeries>
				</pieDataset>
				<piePlot>
					<plot/>
					<itemLabel/>
				</piePlot>
			</pieChart>
		</band>
	</summary>
	<noData>
		<band height="120">
			<image>
				<reportElement x="0" y="0" width="300" height="50" uuid="df990c7e-f14a-4198-a191-63960ca6d773"/>
				<imageExpression><![CDATA[$P{REPORT_MGR_BASE} +"/GetImage?image=swampfox_logo"]]></imageExpression>
			</image>
			<textField>
				<reportElement x="500" y="39" width="349" height="21" uuid="2d263199-80a8-4406-adbd-ce55f9f0b83f"/>
				<textElement textAlignment="Right" verticalAlignment="Middle">
					<font size="11"/>
				</textElement>
				<textFieldExpression><![CDATA[$P{SubTitle}]]></textFieldExpression>
			</textField>
			<textField>
				<reportElement x="0" y="0" width="850" height="40" uuid="6993f3b6-3de4-4b02-80f5-2278af0e0d19">
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
				<textFieldExpression><![CDATA["Agent Satisfaction Survey"]]></textFieldExpression>
			</textField>
			<textField>
				<reportElement x="0" y="80" width="860" height="40" uuid="f93d0136-020e-4264-aa3c-9fa375fade24">
					<property name="local_mesure_unitx" value="pixel"/>
					<property name="com.jaspersoft.studio.unit.x" value="px"/>
					<property name="local_mesure_unitwidth" value="pixel"/>
					<property name="com.jaspersoft.studio.unit.width" value="px"/>
					<property name="local_mesure_unitheight" value="pixel"/>
					<property name="com.jaspersoft.studio.unit.height" value="px"/>
				</reportElement>
				<textElement textAlignment="Center" verticalAlignment="Middle">
					<font fontName="Times New Roman" size="16"/>
				</textElement>
				<textFieldExpression><![CDATA["No results found."]]></textFieldExpression>
			</textField>
		</band>
	</noData>
</jasperReport>

', jasper_report_compilation='2023-12-14 19:26:31.285', application='', visible=true, supported_formats='PDF', data_source_type='jdbc', last_update='2024-01-05 19:54:06.964', "version"=2, last_user='DBeaver 22.2.2 - Main <first_in_line>'
WHERE id=82;
