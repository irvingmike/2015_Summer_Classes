<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
   <head>
      <title>
         XML Customer Information
      </title>
	  <link href="common.css" rel="stylesheet" type="text/css" />
   </head>
<body>
<table border="0" cellspacing="0" cellpadding="4">
    <tr><td colspan="9"><h2>Customer Information</h2></td></tr>
<tr class="heading">
    <td>Position</td>
    <td>Remainder</td>
    <td>Number</td>
    <td>Name</td>
    <td>Street</td>
    <td>City</td>
    <td>State</td>
    <td>Zip</td>
    <td align="right">Balance</td>
</tr>
<xsl:for-each select="customers/customer">
    <xsl:sort select="balance" data-type="number" /> 
	<xsl:choose>		
		<xsl:when test="position() mod 2 > 0">
			<tr style="background-color:#ccffff;">
		</xsl:when>		
		<xsl:otherwise>
			<tr style="background-color:#ffffcc;">
		</xsl:otherwise>
	</xsl:choose>
	    		<td><xsl:number value="position()" format="001" /></td>
    			<td><xsl:value-of select="position() mod 2"/></td>
    			<td><xsl:value-of select="number"/></td>
    			<td><xsl:value-of select="name"/></td>
    			<td><xsl:value-of select="address/street"/></td>
    			<td><xsl:value-of select="address/city"/></td>
    			<td><xsl:value-of select="address/state"/></td>
    			<td><xsl:value-of select="address/zip"/></td>
    			<td align="right"><xsl:value-of select="balance"/></td>
			</tr>
</xsl:for-each>
	<tr>
		<td colspan="7">
			<hr color="blue"/>
		</td>
	</tr>
	<tr>
		<td colspan="3">
			The number of customers is: <xsl:value-of select="count(customers/customer)"/>
		</td>
		<td colspan="4" align="right">
			The sum of current balance is: <xsl:value-of select="format-number(sum(customers/customer/balance), '###,##0.00')"/>
		</td>
	</tr>
	<tr>
		<td colspan="7" align="right">
			The average current balance is: 
			<xsl:value-of select="format-number((sum(customers/customer/balance)) div (count(customers/customer)), '###,##0.00')"/>
		</td>
	</tr>
</table>
</body>
</html>
</xsl:template>
</xsl:stylesheet>