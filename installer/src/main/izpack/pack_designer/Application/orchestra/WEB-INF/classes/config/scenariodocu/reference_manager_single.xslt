<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:doc="urn:emds:docu">

	<xsl:template name ="makeLink">

		<xsl:param name="hrefValue" />
		<xsl:param name="textValue" />
		<xsl:param name="targetValue" />

		<xsl:param name="elementtype" />
		
		<xsl:if test="$elementtype = 'ScenarioElement' ">
		     <a><xsl:attribute name="target"><xsl:value-of select="$targetValue"/></xsl:attribute><xsl:attribute name="href">scenario.xml#<xsl:value-of select="$hrefValue"/></xsl:attribute><xsl:value-of disable-output-escaping="yes" select="$textValue"/></a>
		</xsl:if>

		<xsl:if test="$elementtype = 'MediaElement' ">

		     <a><xsl:attribute name="target">right</xsl:attribute><xsl:attribute name="href"><xsl:value-of select="concat($hrefValue,'.html')"/></xsl:attribute><xsl:value-of disable-output-escaping="yes" select="$textValue"/></a>

			<!-- 
		   <xsl:variable name="codefile" select="document(concat($hrefValue,'.html'),/)"/>
		   <xsl:copy-of select="$codefile/html/node()"/>  -->
		</xsl:if>

	</xsl:template>

</xsl:stylesheet> 