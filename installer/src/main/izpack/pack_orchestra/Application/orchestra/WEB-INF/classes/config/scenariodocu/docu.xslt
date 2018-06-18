<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:doc="urn:emds:docu">
	<xsl:import href="basetemplate.xslt" />
<xsl:output method="html" encoding="ISO-8859-1" indent="yes" />


	<xsl:template match="doc:scenario">

		<html>
			<body>				

				<xsl:if test="count(doc:element[./doc:type='XMLSchema']) > 0">
					<h1 style="background-color: rgb(221, 221, 255);">XML Schema</h1>
					<xsl:apply-templates select="doc:element[./doc:type='XMLSchema']"/>
					<br/>
					<br/>
					<br/>
				</xsl:if>
				
				<xsl:if test="count(doc:element[./doc:type='MessageType']) > 0">
					<h1 style="background-color: rgb(221, 221, 255);">Message types</h1>
					<xsl:apply-templates select="doc:element[./doc:type='MessageType']"/>
					<br/>
					<br/>
					<br/>
				</xsl:if>

				<xsl:if test="count(doc:element[./doc:type='MessageMapping']) > 0">
					<h1 style="background-color: rgb(221, 221, 255);">Mappings</h1>
					<xsl:apply-templates select="doc:element[./doc:type='MessageMapping']"/>
					<br/>
					<br/>
					<br/>
				</xsl:if>

				<xsl:if test="count(doc:element[./doc:type='ProcessModell']) > 0">
					<h1 style="background-color: rgb(221, 221, 255);">Process models</h1>
					<xsl:apply-templates select="./doc:element[./doc:type='ProcessModell']"/>
					<br/>
					<br/>
					<br/>
				</xsl:if>
				
				<xsl:if test="count(doc:element[./doc:type='Channel']) > 0">
					<h1 style="background-color: rgb(221, 221, 255);">Channels</h1>
					<xsl:apply-templates select="doc:element[./doc:type='Channel']"/>
					<br/>
					<br/>
					<br/>
				</xsl:if>

				<xsl:if test="count(doc:element[./doc:type='EnvironmentEntry']) > 0">
					<h1 style="background-color: rgb(221, 221, 255);">Environment entries</h1>
					<xsl:apply-templates select="doc:element[./doc:type='EnvironmentEntry']"/>
					<br/>
					<br/>
					<br/>
				</xsl:if>

				<xsl:if test="count(doc:element[./doc:type='ParserDescription']) > 0">
					<h1 style="background-color: rgb(221, 221, 255);">Parser descriptions</h1>
					<xsl:apply-templates select="doc:element[./doc:type='ParserDescription']"/>
					<br/>
					<br/>
					<br/>
				</xsl:if>
				
				<xsl:if test="count(doc:element[./doc:type='LookupTable']) > 0">
					<h1 style="background-color: rgb(221, 221, 255);">LookupTables</h1>
					<xsl:apply-templates select="doc:element[./doc:type='LookupTable']"/>
					<br/>
					<br/>
					<br/>
				</xsl:if>
				
				<xsl:if test="count(doc:element[./doc:type='JAVASOURCE']) > 0">
					<h1 style="background-color: rgb(221, 221, 255);">Java sources</h1>
					<xsl:apply-templates select="doc:element[./doc:type='JAVASOURCE']"/>
					<br/>
					<br/>
					<br/>
				</xsl:if>
				
				<xsl:if test="count(doc:element[./doc:type='ServiceDeclaration']) > 0">
					<h1 style="background-color: rgb(221, 221, 255);">Service declarations</h1>
					<xsl:apply-templates select="doc:element[./doc:type='ServiceDeclaration']"/>
					<br/>
					<br/>
					<br/>
				</xsl:if>
				
				<xsl:if test="count(doc:element[./doc:type='ServiceProvider']) > 0">
					<h1 style="background-color: rgb(221, 221, 255);">Service providers</h1>
					<xsl:apply-templates select="doc:element[./doc:type='ServiceProvider']"/>
					<br/>
					<br/>
					<br/>
				</xsl:if>		
				
				<xsl:if test="count(doc:element[./doc:type='MediaElement']) > 0">
					<h1 style="background-color: rgb(221, 221, 255);">MediaElement</h1>
					<xsl:apply-templates select="doc:element[./doc:type='MediaElement']"/>
					<br/>
					<br/>
					<br/>
				</xsl:if>
				
				<xsl:if test="count(doc:element[./doc:type='ServiceInterface' and ./doc:name != 'DEFAULT_INTERFACE' ]) > 0">
					<h1 style="background-color: rgb(221, 221, 255);">Signals</h1>
					<xsl:apply-templates select="doc:element[./doc:type='ServiceInterface' and ./doc:name != 'DEFAULT_INTERFACE'  ]"/>
					<br/>
					<br/>
					<br/>
				</xsl:if>				
				
				<xsl:if test="count(doc:element[./doc:type='Credential']) > 0">
					<h1 style="background-color: rgb(221, 221, 255);">Credentials</h1>
					<xsl:apply-templates select="doc:element[./doc:type='Credential']"/>
					<br/>
					<br/>
					<br/>
				</xsl:if>						

				<xsl:if test="count(doc:element[./doc:type='SecGroup']) > 0">
					<h1 style="background-color: rgb(221, 221, 255);">Groups</h1>
					<xsl:apply-templates select="doc:element[./doc:type='SecGroup']"/>
					<br/>
					<br/>
					<br/>
				</xsl:if>

				<xsl:if test="count(doc:element[./doc:type='Role']) > 0">
					<h1 style="background-color: rgb(221, 221, 255);">Role</h1>
					<xsl:apply-templates select="doc:element[./doc:type='Role']"/>
					<br/>
					<br/>
					<br/>
				</xsl:if>				
										
			</body>
		</html>

	</xsl:template>
	

</xsl:stylesheet> 