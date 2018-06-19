<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:doc="urn:emds:docu">
	<xsl:import href="reference_manager.xslt" />
	<xsl:output method="html" encoding="ISO-8859-1" indent="yes" />

		<xsl:template match="doc:element[./doc:type='ServiceProvider']">

				<a><xsl:attribute name="name"><xsl:value-of disable-output-escaping="yes" select="@id"/></xsl:attribute><h2 style="background-color: rgb(204, 204, 204);">ServiceProvider <xsl:value-of select="./doc:name"/></h2></a>
    
       			<h3>Base data</h3>

				<table>
					<tr><td>Name:</td><td><xsl:value-of select="./doc:name"/></td></tr>
					<tr><td>Description:</td><td><xsl:value-of select="./doc:description"/></td></tr>
   			    </table>    		    	
   
	       		<h3>WSDL-Files</h3>
				
					<table>
	        
            			<xsl:for-each select=".//doc:wsdlEntry">
				 
	    				 	<tr>
	    				 		<td width="20%"><xsl:value-of select="./doc:name"/></td>
	    				 		<td width="40%">
	    				 					<a><xsl:attribute name="target">_blank</xsl:attribute><xsl:attribute name="href"><xsl:value-of select="./doc:wsdlReference"/></xsl:attribute>Link</a>
	    				 		</td>
	    				 	</tr>
				 
		    			 </xsl:for-each>

            
	    			</table> 			
			
    			<xsl:apply-templates select="./doc:references"/>
    			<xsl:apply-templates select="./doc:referrers"/>
    			<xsl:apply-templates select="./doc:documentation"/>
    			<br/>
    			<br/>
    	
	</xsl:template>	

	<xsl:template match="doc:element[./doc:type='ServiceDeclaration']">

				<a><xsl:attribute name="name"><xsl:value-of disable-output-escaping="yes" select="@id"/></xsl:attribute><h2 style="background-color: rgb(204, 204, 204);">ServiceDeclaration <xsl:value-of select="./doc:name"/></h2></a>
    
       			<h3>Base data</h3>

				<table>
					<tr><td>Name:</td><td><xsl:value-of select="./doc:name"/></td></tr>
					<tr><td>Description:</td><td><xsl:value-of select="./doc:description"/></td></tr>
   			    </table>    		    	

	       		<h3>WSDL-Files</h3>
				
					<table>
	        
            			<xsl:for-each select=".//doc:wsdlEntry">
				 
	    				 	<tr>
	    				 		<td width="20%"><xsl:value-of select="./doc:name"/></td>
	    				 		<td width="40%">
	    				 					<a><xsl:attribute name="target">_blank</xsl:attribute><xsl:attribute name="href"><xsl:value-of select="./doc:wsdlReference"/></xsl:attribute>Link</a>
	    				 		</td>
	    				 	</tr>
				 
		    			 </xsl:for-each>

            
	    			</table> 			
			
    			<xsl:apply-templates select="./doc:references"/>
    			<xsl:apply-templates select="./doc:referrers"/>
    			<xsl:apply-templates select="./doc:documentation"/>
    			<br/>
    			<br/>
    	
	</xsl:template>	

	<xsl:template match="doc:element[./doc:type='JAVASOURCE']">

				<a><xsl:attribute name="name"><xsl:value-of disable-output-escaping="yes" select="@id"/></xsl:attribute><h2 style="background-color: rgb(204, 204, 204);">Java <xsl:value-of select="./doc:name"/></h2></a>
    
       			<h3>Base data</h3>

				<table>
					<tr><td>Name:</td><td><xsl:value-of select="./doc:name"/></td></tr>
					<tr><td>Description:</td><td><xsl:value-of select="./doc:description"/></td></tr>
					<tr><td>Type:</td><td><xsl:value-of select="./doc:channeltype"/></td></tr>
    			</table>    		    	
    
				<h3>Script</h3>
				<pre style="background-color: rgb(221, 221, 255);">
				<code><xsl:value-of select="./doc:source"/></code>
				</pre>
				<br/>
			
    			<xsl:apply-templates select="./doc:references"/>
    			<xsl:apply-templates select="./doc:referrers"/>
    			<xsl:apply-templates select="./doc:documentation"/>
    			<br/>
    			<br/>
    	
	</xsl:template>	

	<xsl:template match="doc:element[./doc:type='LookupTable']">

				<a><xsl:attribute name="name"><xsl:value-of disable-output-escaping="yes" select="@id"/></xsl:attribute><h2 style="background-color: rgb(204, 204, 204);">LookupTable <xsl:value-of select="./doc:name"/></h2></a>
				
    			<h3>Base data</h3>

				<table>
					<tr><td>Name:</td><td><xsl:value-of select="./doc:name"/></td></tr>
					<tr><td>Description:</td><td><xsl:value-of select="./doc:description"/></td></tr>
    			</table>
    				
    			<xsl:if test="./doc:mode = 'DATABASE'">
					<h3>Configuration: Database mode</h3>
					<table>
						<tr><td>Tablename:</td><td><xsl:value-of select="./doc:table"/></td></tr>
						<tr><td>Key column:</td><td><xsl:value-of select="./doc:keycolumn"/></td></tr>
						<tr><td>Value column:</td><td><xsl:value-of select="./doc:valuecolumn"/></td></tr>
	    			</table> 					
				</xsl:if>
 	
    		<xsl:if test="./doc:mode = 'FILE'">
					<h3>Configuration: File mode </h3>
					<table>
						<tr><td>Filename:</td><td><xsl:value-of select="./doc:file"/></td></tr>
	    			</table> 					
				</xsl:if>
    		
        <xsl:if test="./doc:mode = 'INTERNAL'">
					<h3>Configuration: Internal </h3>
					<table>
						<tr><td>Key</td><td>Value</td></tr>
            
            			<xsl:for-each select=".//doc:lookup/doc:entry">
				 
	    				 	<tr>
	    				 		<td width="20%"><xsl:value-of select="./doc:key"/></td>
	    				 		<td width="40%"><xsl:value-of select="./doc:value"/></td>
	    				 	</tr>
				 
		    			 </xsl:for-each>

            
	    			</table> 					
				</xsl:if>
        		    	
    			<xsl:apply-templates select="./doc:references"/>
    			<xsl:apply-templates select="./doc:referrers"/>
    			<xsl:apply-templates select="./doc:documentation"/>
    			<br/>
    			<br/>
	</xsl:template>	

	<xsl:template match="doc:element[./doc:type='ProcessModell']">

				<a><xsl:attribute name="name"><xsl:value-of disable-output-escaping="yes" select="@id"/></xsl:attribute><h2 style="background-color: rgb(204, 204, 204);">Processmodell <xsl:value-of select="./doc:name"/></h2></a>
				
    			<h3>Base data</h3>

				<table>
					<tr><td>Name:</td><td><xsl:value-of select="./doc:name"/></td></tr>
					<tr><td>Description:</td><td><xsl:value-of select="./doc:description"/></td></tr>
    			</table>
    	
    			<xsl:apply-templates select="./doc:parameters"/>
    			
    			<h3>Process diagram</h3>
    			<img border="2"><xsl:attribute name="src"><xsl:value-of select="./doc:graph"/></xsl:attribute></img>
    			    	
    			<xsl:apply-templates select="./doc:references"/>
    			<xsl:apply-templates select="./doc:referrers"/>
    			<xsl:apply-templates select="./doc:documentation"/>
    			<br/>
    			<br/>
	</xsl:template>	
	
	<xsl:template match="doc:element[./doc:type='XMLSchema']">

				<a><xsl:attribute name="name"><xsl:value-of disable-output-escaping="yes" select="@id"/></xsl:attribute><h2 style="background-color: rgb(204, 204, 204);">XMLSchema <xsl:value-of select="./doc:name"/></h2></a>
		
    			<h3>Base data</h3>

				<table>
					<tr><td>Name:</td><td><xsl:value-of select="./doc:name"/></td></tr>
					<tr><td>Description:</td><td><xsl:value-of select="./doc:description"/></td></tr>
    			</table>

    			<h3>XML Schema</h3>
				<a><xsl:attribute name="target">_blank</xsl:attribute><xsl:attribute name="href"><xsl:value-of select="./doc:id"/>.xsd</xsl:attribute>Schema description</a>

    					    	
    			<xsl:apply-templates select="./doc:references"/>
    			<xsl:apply-templates select="./doc:referrers"/>
    			<xsl:apply-templates select="./doc:documentation"/>
    			<br/>
    			<br/>
	</xsl:template>		
	
	<xsl:template match="doc:element[./doc:type='MediaElement']">

				<a><xsl:attribute name="name"><xsl:value-of disable-output-escaping="yes" select="@id"/></xsl:attribute><h2 style="background-color: rgb(204, 204, 204);">MediaElement <xsl:value-of select="./doc:name"/></h2></a>
		
    			<h3>Base data</h3>

				<table>
					<tr><td>Name:</td><td><xsl:value-of select="./doc:name"/></td></tr>
					<tr><td>Description:</td><td><xsl:value-of select="./doc:description"/></td></tr>
    			</table>

    			<h3>MediaElement</h3>
				<a><xsl:attribute name="target">right</xsl:attribute><xsl:attribute name="href"><xsl:value-of select="./doc:file"/></xsl:attribute>Content</a>
	   			<br/>
    			<br/>
	</xsl:template>		
	
	<xsl:template match="doc:element[./doc:type='JarFile']">

				<a><xsl:attribute name="name"><xsl:value-of disable-output-escaping="yes" select="@id"/></xsl:attribute><h2 style="background-color: rgb(204, 204, 204);">Channel <xsl:value-of select="./doc:name"/></h2></a>

    			<h3>Base data</h3>

				<table>
					<tr><td>Name:</td><td><xsl:value-of select="./doc:name"/></td></tr>
					<tr><td>Description:</td><td><xsl:value-of select="./doc:description"/></td></tr>
    			</table>    			
    			
    			<xsl:apply-templates select="./doc:references"/>
    			<xsl:apply-templates select="./doc:referrers"/>
    			<xsl:apply-templates select="./doc:documentation"/>
    			<br/>
    			<br/>
    	
	</xsl:template>	
	
		
	<xsl:template match="doc:element[./doc:type='EnvironmentEntry']">

				<a><xsl:attribute name="name"><xsl:value-of disable-output-escaping="yes" select="@id"/></xsl:attribute><h2 style="background-color: rgb(204, 204, 204);">Environment Entry <xsl:value-of select="./doc:name"/></h2></a>
    		
    			<h3>Base data</h3>

				<table>
					<tr><td>Name:</td><td><xsl:value-of select="./doc:name"/></td></tr>
					<tr><td>Description:</td><td><xsl:value-of select="./doc:description"/></td></tr>
					<tr><td>Type:</td><td><xsl:value-of select="./doc:environmenttype"/></td></tr>
    			</table>    		    	
				
				<h3>Configuration</h3>
    			<table border="2" width="100%">
	
				<tr>
			 		<td>Name</td>
			 		<td>Value</td>
			 		<td>Description</td>
			 	</tr>

				 <xsl:for-each select=".//doc:enventry">
				 
				 	<tr>
				 		<td width="10%"><xsl:value-of select="./doc:name"/></td>
				 		<td width="40%"><xsl:value-of select="./doc:value"/></td>
				 		<td width="50%"><xsl:value-of select="./doc:description"/></td>
				 	</tr>
				 
		    	 </xsl:for-each>

		    	</table>

    			<xsl:apply-templates select="./doc:references"/>
    			<xsl:apply-templates select="./doc:referrers"/>
    			<xsl:apply-templates select="./doc:documentation"/>
				<br/>
    			<br/>

	</xsl:template>			
		
	<xsl:template match="doc:element[./doc:type='Channel']">

				<a><xsl:attribute name="name"><xsl:value-of disable-output-escaping="yes" select="@id"/></xsl:attribute><h2 style="background-color: rgb(204, 204, 204);">Channel <xsl:value-of select="./doc:name"/></h2></a>
    
       			<h3>Base data</h3>

				<table>
					<tr><td>Name:</td><td><xsl:value-of select="./doc:name"/></td></tr>
					<tr><td>Description:</td><td><xsl:value-of select="./doc:description"/></td></tr>
					<tr><td>Type:</td><td><xsl:value-of select="./doc:channeltype"/></td></tr>
    			</table>    		    	
    
    			<xsl:apply-templates select="./doc:parameters"/>
    	
				<xsl:if test="count(./doc:textsection) > 0">
					<h3>Configuration</h3>
					<xsl:apply-templates select="./doc:textsection"/>
					<br/>
				</xsl:if>
    		
    			<xsl:apply-templates select="./doc:references"/>
    			<xsl:apply-templates select="./doc:referrers"/>
    			<xsl:apply-templates select="./doc:documentation"/>
    			<br/>
    			<br/>
    	
	</xsl:template>		
	
	<xsl:template match="doc:element[./doc:type='ParserDescription']">

				<a><xsl:attribute name="name"><xsl:value-of disable-output-escaping="yes" select="@id"/></xsl:attribute>
				   <h2 style="background-color: rgb(204, 204, 204);">Parser description <xsl:value-of select="./doc:name"/></h2>
				</a>

				<xsl:if test="count(./doc:description) > 0">
					<h3>Description</h3>
					<p><xsl:value-of select="./doc:description"/></p>
				</xsl:if>

				<h3>Script</h3>
				<pre style="background-color: rgb(221, 221, 255);">
				<code><xsl:value-of select="./doc:parserScript"/></code>
				</pre>
				<br/>

    			<xsl:apply-templates select="./doc:referrers"/>
    			<xsl:apply-templates select="./doc:documentation"/>
    			<br/>
    			<br/>

	</xsl:template>
	
	<xsl:template match="doc:element[./doc:type='ServiceInterface']">

			<a><xsl:attribute name="name"><xsl:value-of disable-output-escaping="yes" select="@id"/></xsl:attribute>
			   <h2 style="background-color: rgb(204, 204, 204);">Signal <xsl:value-of select="./doc:name"/></h2>
			</a>

			<xsl:if test="count(./doc:description) > 0">
				<h3>Description</h3>
				<p><xsl:value-of select="./doc:description"/></p>
			</xsl:if>

			<xsl:apply-templates select="./doc:parameters"/>

			<xsl:apply-templates select="./doc:references"/>
			<xsl:apply-templates select="./doc:referrers"/>
			<xsl:apply-templates select="./doc:documentation"/>
		<br/>
		<br/>

	</xsl:template>
	
	<xsl:template match="doc:element[./doc:type='MessageMapping']">

				<a><xsl:attribute name="name"><xsl:value-of disable-output-escaping="yes" select="@id"/></xsl:attribute><h2 style="background-color: rgb(204, 204, 204);">Message mapping <xsl:value-of select="./doc:name"/></h2></a>

       			<h3>Base data</h3>

				<table>
					<tr><td>Name:</td><td><xsl:value-of select="./doc:name"/></td></tr>
					<tr><td>Description:</td><td><xsl:value-of select="./doc:description"/></td></tr>
					<tr><td>Type:</td><td><xsl:value-of select="./doc:mappingtype"/></td></tr>
					<tr><td>Source message:</td><td><xsl:apply-templates select="./doc:messagetypes/doc:reference[@role='source']"/></td></tr>
					<tr><td>Target message:</td><td><xsl:apply-templates select="./doc:messagetypes/doc:reference[@role='target']"/> </td></tr>
    			</table>    		    	
    			
				<xsl:if test="count(./doc:textsection) > 0">
					<h3>Configuration</h3>
					<xsl:apply-templates select="./doc:textsection"/>
					<br/>
				</xsl:if>
    			
				<xsl:if test="./doc:mappingtype = 'internal'">
    				<h3>Mappingdiagramm</h3>
    				<img border="2"><xsl:attribute name="src"><xsl:value-of select="./doc:graph"/></xsl:attribute></img>
     			    <xsl:apply-templates select="./doc:nodemapping"/>
    			</xsl:if>
    			
				<xsl:if test="./doc:mappingtype = 'script'">
    
    				<xsl:apply-templates select="./doc:parameters"/>

    				<h3>Script</h3>
					<pre style="background-color: rgb(221, 221, 255);">
					<code><xsl:value-of select="./doc:xjavaScript"/></code>
					</pre>
					<br/>
    			</xsl:if>
    			
    			<xsl:apply-templates select="./doc:references"/>
    			<xsl:apply-templates select="./doc:referrers"/>
    			<xsl:apply-templates select="./doc:documentation"/>
    			<br/>
    			<br/>
	</xsl:template>	

	<xsl:template match="doc:nodemapping">

		<h4>Node mapping</h4>
    	<img border="1"><xsl:attribute name="src"><xsl:value-of select="./doc:graph"/></xsl:attribute></img>

	</xsl:template>			
	
	<xsl:template match="doc:element[./doc:type='MessageType']">

				<a><xsl:attribute name="name"><xsl:value-of disable-output-escaping="yes" select="@id"/></xsl:attribute><h2 style="background-color: rgb(204, 204, 204);">Message type <xsl:value-of select="./doc:name"/></h2></a>
    	
    			<h3>Base data</h3>
    	
    			<table>
					<tr><td>Name:</td><td><xsl:value-of select="./doc:name"/></td></tr>
					<tr><td>Description:</td><td><xsl:value-of select="./doc:description"/></td></tr>
    			</table> 
    	
    			<h3>Typedefinition</h3>

				<table style="background-color: rgb(221, 221, 255); margin:0px; padding:0;" border="0">

						<tr>
							<td><code>Name  </code></td>
							<td	style="width: 120px"><code>Cardinality  </code></td>
							<td><code>Type  </code></td>
						</tr>


					 <xsl:for-each select="./doc:type.description/doc:type.row">
					 
						<tr> 
							<td ><code><xsl:value-of select="./doc:ident"/><xsl:value-of select="./doc:localName"/>  </code></td>
							<td ><code>  <xsl:value-of select="./doc:cardinality"/>  </code></td>
							<td ><code>  <xsl:value-of select="./doc:typeName"/>  </code></td>
						</tr>
					 
					 </xsl:for-each>
				</table>   

				<!-- 
    			<img border="2"><xsl:attribute name="src"><xsl:value-of select="./doc:graph"/></xsl:attribute></img>
    			 -->
    			 
    			<xsl:apply-templates select="./doc:references"/>
    			<xsl:apply-templates select="./doc:referrers"/>
    			<xsl:apply-templates select="./doc:documentation"/>
     			<br/>
    			<br/>
   			
	</xsl:template>		
		
		<xsl:template match="doc:element[./doc:type='Credential' or ./doc:type='Role' or ./doc:type='SecGroup']">

					<xsl:if test="./doc:type='Credential'">
						<a><xsl:attribute name="name"><xsl:value-of disable-output-escaping="yes" select="@id"/></xsl:attribute><h2 style="background-color: rgb(204, 204, 204);">Credential <xsl:value-of select="./doc:name"/></h2></a>
					</xsl:if>							

					<xsl:if test="./doc:type='SecGroup'">
						<a><xsl:attribute name="name"><xsl:value-of disable-output-escaping="yes" select="@id"/></xsl:attribute><h2 style="background-color: rgb(204, 204, 204);">Group <xsl:value-of select="./doc:name"/></h2></a>
					</xsl:if>	
					
					<xsl:if test="./doc:type='Role'">
						<a><xsl:attribute name="name"><xsl:value-of disable-output-escaping="yes" select="@id"/></xsl:attribute><h2 style="background-color: rgb(204, 204, 204);">Role <xsl:value-of select="./doc:name"/></h2></a>
					</xsl:if>							
    
       			<h3>Base data</h3>

				<table>
					<tr><td>Name:</td><td><xsl:value-of select="./doc:name"/></td></tr>
					<tr><td>Description:</td><td><xsl:value-of select="./doc:description"/></td></tr>
    			</table>    		    	
			
    			<xsl:apply-templates select="./doc:references"/>
    			<xsl:apply-templates select="./doc:referrers"/>
    			<xsl:apply-templates select="./doc:documentation"/>
    			<br/>
    			<br/>
    	
	</xsl:template>		
		
	<xsl:template match="doc:referrers">

		<p/>
		<h3>Referenced by:</h3>
		<p/>

		<xsl:if test="count( ./doc:reference[@type != 'ServiceInterface'] ) > 0">
			<xsl:apply-templates select="./doc:reference[@type != 'ServiceInterface']"/>
		</xsl:if>

		<xsl:if test="count( ./doc:reference[@type != 'ServiceInterface'] ) = 0">
			The element is currently not referenced			
		</xsl:if>

    	
	</xsl:template>			
	
	<xsl:template match="doc:references">

		<p/>
		<h3>References following elements:</h3>
		<p/>

		<xsl:if test="count( ./doc:reference[@type != 'ServiceInterface'  or ( @type = 'ServiceInterface' and @targetname != 'DEFAULT_INTERFACE' ) ] ) > 0">
			<xsl:apply-templates select="./doc:reference[@type != 'ServiceInterface'  or ( @type = 'ServiceInterface' and @targetname != 'DEFAULT_INTERFACE' )]"/>
		</xsl:if>

		<xsl:if test="count( ./doc:reference[@type != 'ServiceInterface'  or ( @type = 'ServiceInterface' and @targetname != 'DEFAULT_INTERFACE' ) ] ) = 0">
			The element has no references to other elements		
		</xsl:if>

    	
	</xsl:template>			
				
	
	<xsl:template match="doc:documentation">

		<p/>
		<h3>Additional documentation:</h3>
		<p/>
		
			<xsl:apply-templates select="./doc:reference"/>
    	
	</xsl:template>			
	
	<xsl:template match="doc:textsection">

			<table border="2" width="100%">

			<tr>
		 		<td>Name</td>
		 		<td>Description</td>
		 	</tr>

			 <xsl:for-each select="./doc:text">
			 
			 	<tr>
			 		<td width="10%"><xsl:value-of select="./doc:title"/></td>
			 		<td><pre><code><xsl:value-of select="./doc:description"/></code></pre></td>							
			 	</tr>
			 
	    	 </xsl:for-each>

	    	</table>
    	
	</xsl:template>		
					
				
	
	<xsl:template match="doc:parameters">

		<h3>Parameter:</h3><p/>

		<xsl:if test="count(./doc:parameter) = 0">
   			No parameters configured
   		</xsl:if>
   	
		<xsl:if test="count(./doc:parameter) > 0">

			<table border="2">
			
				<tr>
			 		<td>Name</td>
			 		<td>Type</td>
			 		<td>Description</td>
			 		<td>Usage</td>
			 	</tr>
	
			 <xsl:for-each select="./doc:parameter">
			 
			 	<tr>
			 		<td><xsl:value-of select="./doc:name"/></td>
			 		<td><xsl:value-of select="./doc:type"/></td>
			 		<td><xsl:value-of select="./doc:description"/></td>
			 		<td><xsl:value-of select="./doc:pattern"/> </td>
			 	</tr>
			 
	    	 </xsl:for-each>
	    
	    	</table>

    	</xsl:if>
    	
	</xsl:template>	
	
	<xsl:template match="doc:reference">
	
		<xsl:if test="@type != 'MediaElement'">
			<xsl:call-template name="makeLink">
				<xsl:with-param name="hrefValue"    select="@ref"/>
				<xsl:with-param name="textValue"    select="concat(@type,' - ',@targetname)"/>
				<xsl:with-param name="targetValue"  select="'_self'"/>
				<xsl:with-param name="elementtype" 	select="'ScenarioElement'"/>				
			</xsl:call-template>
		</xsl:if>

		<xsl:if test="@type = 'MediaElement'">

			<xsl:call-template name="makeLink">
				<xsl:with-param name="hrefValue"    select="@ref"/>
				<xsl:with-param name="textValue"    select="concat(@type,' - ',@targetname)"/>
				<xsl:with-param name="targetValue"  select="'_self'"/>
				<xsl:with-param name="elementtype" 	select="'MediaElement'"/>				
			</xsl:call-template>
		</xsl:if>
		<br/>
	
	</xsl:template>			
	

</xsl:stylesheet>