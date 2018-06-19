<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:doc="urn:emds:docu">

	<xsl:import href="reference_manager.xslt" />
	<xsl:output method="html" encoding="ISO-8859-1" indent="yes" />

	
	<xsl:output method="html" encoding="ISO-8859-1" indent="yes" />
	

	<xsl:template match="doc:scenario">

		<html>

			<style type="text/css">
			a:link {color:#551A8B; text-decoration:none}
			a:visited {color:#551A8B; text-decoration:none}
			a:active {color:#551A8B; text-decoration:none}
			a:hover {color:#EE0000; text-decoration:underline}
			</style>

			<body style="color: rgb(0, 0, 0); background-color: rgb(232, 235, 240);" alink="#ee0000" link="#551a8b" vlink="#551a8b">

				<div style="text-align: center;"><big style="font-weight: bold; color: rgb(0, 0, 153); font-family: Calibri;"><span style="font-weight: bold;">Scenario<br/><xsl:value-of select="./doc:scenarioinfo/doc:name"/></span></big>
				<br/>
				<br/>
				
				<xsl:if test="count(doc:scenarioelementinfo[./doc:type='XMLSchema']) > 0">
					<small>XML Schema</small>
					<br/>
					<xsl:apply-templates select="doc:scenarioelementinfo[./doc:type='XMLSchema']"/>
					<br/>
				</xsl:if>
				
				<xsl:if test="count(doc:scenarioelementinfo[./doc:type='MessageType']) > 0">
					<small>Message types</small><br/>
					<xsl:apply-templates select="doc:scenarioelementinfo[./doc:type='MessageType']"/>
					<br/>
				</xsl:if>
				
				<xsl:if test="count(doc:scenarioelementinfo[./doc:type='MessageMapping']) > 0">
					<small>Mappings</small><br/>
					<xsl:apply-templates select="doc:scenarioelementinfo[./doc:type='MessageMapping']"/>
					<br/>
				</xsl:if>
				
				<xsl:if test="count(doc:scenarioelementinfo[./doc:type='ProcessModell']) > 0">
					<small>Process models</small><br/>
					<xsl:apply-templates select="./doc:scenarioelementinfo[./doc:type='ProcessModell']"/>
					<br/>
				</xsl:if>

				<xsl:if test="count(doc:scenarioelementinfo[./doc:type='Channel']) > 0">
					<small>Channels</small><br/>
					<xsl:apply-templates select="doc:scenarioelementinfo[./doc:type='Channel']"/>
					<br/>
				</xsl:if>
				
				<xsl:if test="count(doc:scenarioelementinfo[./doc:type='EnvironmentEntry']) > 0">
					<small>Environment</small><br/>
					<xsl:apply-templates select="doc:scenarioelementinfo[./doc:type='EnvironmentEntry']"/>
					<br/>
				</xsl:if>
				
				<xsl:if test="count(doc:scenarioelementinfo[./doc:type='ParserDescription']) > 0">
					<small>Parser descriptions</small><br/>
					<xsl:apply-templates select="doc:scenarioelementinfo[./doc:type='ParserDescription']"/>
					<br/>
				</xsl:if>

				<xsl:if test="count(doc:scenarioelementinfo[./doc:type='LookupTable']) > 0">
					<small>LookupTables</small><br/>
					<xsl:apply-templates select="doc:scenarioelementinfo[./doc:type='LookupTable']"/>
					<br/>
				</xsl:if>
				
				<xsl:if test="count(doc:scenarioelementinfo[./doc:type='JAVASOURCE']) > 0">
					<small>Java sources</small><br/>
					<xsl:apply-templates select="doc:scenarioelementinfo[./doc:type='JAVASOURCE']"/>
					<br/>
				</xsl:if>				
	
				<xsl:if test="count(doc:scenarioelementinfo[./doc:type='ServiceDeclaration']) > 0">
					<small>Service declarations</small><br/>
					<xsl:apply-templates select="doc:scenarioelementinfo[./doc:type='ServiceDeclaration']"/>
					<br/>
				</xsl:if>	
						
				<xsl:if test="count(doc:scenarioelementinfo[./doc:type='ServiceProvider']) > 0">
					<small>Service provider</small><br/>
					<xsl:apply-templates select="doc:scenarioelementinfo[./doc:type='ServiceProvider']"/>
					<br/>
				</xsl:if>	
					
				<xsl:if test="count(doc:scenarioelementinfo[./doc:type='MediaElement']) > 0">
					<small>Document library</small><br/>
					<xsl:apply-templates select="doc:scenarioelementinfo[./doc:type='MediaElement']"/>
					<br/>
				</xsl:if>						
						
				<xsl:if test="count(doc:scenarioelementinfo[./doc:type='ServiceInterface' and ./doc:name != 'DEFAULT_INTERFACE' ]) > 0">
					<small>Signal</small>
					<br/>
					<xsl:apply-templates select="doc:scenarioelementinfo[./doc:type='ServiceInterface' and ./doc:name != 'DEFAULT_INTERFACE' ]"/>
					<br/>
				</xsl:if>						
						
				
				<xsl:if test="count(doc:scenarioelementinfo[./doc:type='Credential']) > 0">
					<small>Credentials</small>
					<br/>
					<xsl:apply-templates select="doc:scenarioelementinfo[./doc:type='Credential']"/>
					<br/>
				</xsl:if>							

				<xsl:if test="count(doc:scenarioelementinfo[./doc:type='SecGroup']) > 0">
					<small>Groups</small>
					<br/>
					<xsl:apply-templates select="doc:scenarioelementinfo[./doc:type='SecGroup']"/>
					<br/>
				</xsl:if>	
				
				<xsl:if test="count(doc:scenarioelementinfo[./doc:type='Role']) > 0">
					<small>Roles</small>
					<br/>
					<xsl:apply-templates select="doc:scenarioelementinfo[./doc:type='Role']"/>
					<br/>
				</xsl:if>							
				</div>
				
			</body>
		</html>

	</xsl:template>

	<xsl:template match="doc:scenarioelementinfo">
		<small>	
		
			<xsl:call-template name="makeLink">
				<xsl:with-param name="hrefValue"    select="./doc:id"        />
				<xsl:with-param name="elementtype" 	select="'ScenarioElement'" />				
				<xsl:with-param name="textValue"    select="./doc:name"      />
				<xsl:with-param name="targetValue"  select="'right'"         />
			</xsl:call-template>
		</small>
		<br/>
	</xsl:template>	


</xsl:stylesheet> 