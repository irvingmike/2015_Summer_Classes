<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
   <head>
      <title>
         XML Customer Information
      </title>
	  <link href="common.css" rel="stylesheet" type="text/css"/>
   </head>
<body>
<table border="0" cellspacing="0" cellpadding="4">
    <tr><td colspan="4"><h2>Customer Information</h2></td></tr>
<tr>
    <td class="heading">Number</td>
    <td class="heading">Name</td>
    <td class="heading">State</td>
    <td class="heading">Telephone</td>
</tr>
<xsl:for-each select="customers/customer">
    <xsl:sort select="name" /> 
	<tr>
	    	<td><xsl:value-of select="number"/></td>
    		<td style="text-transform:capitalize;"><xsl:value-of select="translate(name, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"/></td>
		<td><xsl:value-of select="address/state"/></td>
    		<td>
                    <xsl:choose>
                        <xsl:when test="normalize-space(telephone)='0000000000'">
                            No phone number provided
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="concat('(',substring(telephone,1,3),') ',substring(telephone,4,3),'-',substring(telephone,7,4))"/>
                        </xsl:otherwise>
                    </xsl:choose>
		</td>
	</tr>
</xsl:for-each>
</table>
</body>
</html>
</xsl:template>
</xsl:stylesheet>