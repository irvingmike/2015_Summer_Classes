<?xml version='1.0' encoding='utf-8' ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" >
<xsl:output method="html"/>
<xsl:include href="Style1.xsl"/>
	<xsl:template match="/">
	<xsl:for-each select="*">
		<xsl:variable name="allContents" select="."/>

		<!--In this template, I load the file into a variable
		    so that it can be handled as a large string.  Using the string functions like substring, it is easy to parse it given the startpositions and lengths	of the elements	-->
		<xsl:call-template name="Style1"/>
		
			<table border="1">	
				<tr><th>ID</th><th>Title</th><th>Name</th><th>Phone</th></tr>
			<xsl:call-template name="SplitFixedLengthToHTML">
				<xsl:with-param name="strInput" select="$allContents"/>
				<xsl:with-param name="lineLength" select="72"/>
			</xsl:call-template>

		</table>	
	</xsl:for-each>

	</xsl:template>


<xsl:template name="SplitFixedLengthToHTML">
   	<xsl:param name="strInput" select="''"/>
	<xsl:param name="lineLength" select="120" />
	<!-- This template recursively calls itself with the input string
	     each iteration process one line in the text file -->
	<xsl:choose>
	 <xsl:when test="string-length($strInput) > $lineLength">	
			<tr>
			<td>
				<xsl:call-template name="TrimTrailing" >
					<xsl:with-param name="strInput" select="substring($strInput, 2, 10)"/>
				</xsl:call-template>
			</td>
			<td>
			<xsl:call-template name="TrimTrailing" >
					<xsl:with-param name="strInput" select="substring($strInput, 12, 25)"/>
				</xsl:call-template>			
			</td>

			<td>
				<xsl:call-template name="TrimTrailing" >
					<xsl:with-param name="strInput" select="substring($strInput, 37, 21)"/>
				</xsl:call-template>			
			</td>

			<td>
				<xsl:call-template name="TrimTrailing" >
					<xsl:with-param name="strInput" select="substring($strInput, 58, 14)"/>
				</xsl:call-template>			
			</td>	
			</tr>
			<xsl:call-template name="SplitFixedLengthToHTML">
			<!-- Here, I am calling the template recursively with the same string
			     less one line -->
			<xsl:with-param name="strInput" select="substring($strInput, $lineLength + 1)"/>
			<xsl:with-param name="lineLength" select="$lineLength"/>
		</xsl:call-template>
     </xsl:when>
	 <xsl:otherwise>

	</xsl:otherwise>
</xsl:choose>
</xsl:template>


<xsl:template name="TrimTrailing">
	
	<!--This template will recursively trim the trailing spaces from a string-->
   	<xsl:param name="strInput" select="''"/>
	<xsl:variable name="strLen" select="string-length($strInput)" />
	<xsl:variable name="strOutput" select="substring($strInput, 1, $strLen - 1 )" />
	<xsl:variable name="strLastChar" select="substring($strInput, $strLen, 1 )" />

	<xsl:choose> 
	 <xsl:when test="$strLastChar = ' '">	

	
		<xsl:call-template name="TrimTrailing" > 
			<xsl:with-param name="strInput" select="$strOutput"/>
		</xsl:call-template>


	</xsl:when>
	 <xsl:otherwise>
			<xsl:value-of select="$strInput" />
	</xsl:otherwise>
	</xsl:choose>


</xsl:template>


</xsl:stylesheet>

