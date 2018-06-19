<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:doc="urn:emds:docu">

	<xsl:output method="html" encoding="ISO-8859-1" indent="yes" />
	
  <xsl:template match="doc:scenario.entry">
    	<a>
			<xsl:attribute name="target">content</xsl:attribute>
			<xsl:attribute name="href"><xsl:value-of select="././@identifier"/>/index.html</xsl:attribute>
			<xsl:value-of select="./@name"/>
		</a>
		(
    	<a>
			<xsl:attribute name="target">content</xsl:attribute>
			<xsl:attribute name="href"><xsl:value-of select="././@identifier"/>/scenario.zip</xsl:attribute>
			Zip
		</a>
		)
		<br/>
	</xsl:template>	
	
  <xsl:template match="doc:scenario.entries">

		<html>

			<style type="text/css">
				a:link {color:#551A8B; text-decoration:none}
				a:visited {color:#551A8B; text-decoration:none}
				a:active {color:#551A8B; text-decoration:none}
				a:hover {color:#EE0000; text-decoration:underline}
			</style>

			<body style="color: rgb(0, 0, 0); background-color: rgb(232, 235, 240);" alink="#ee0000" link="#551a8b" vlink="#551a8b">

        	<h2 style="background-color: rgb(204, 204, 204);" >Scenario index</h2>
			<div style="text-align: center;">
				<br/>	
				<xsl:apply-templates select="doc:scenario.entry"/>
				<br/>			
			<a href= "./all.zip">Export all</a>
			</div>
      </body>
    </html>
  </xsl:template>
   



</xsl:stylesheet> 