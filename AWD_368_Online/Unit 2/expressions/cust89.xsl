<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
  <head>
      <title>
         XML Customer Information
      </title>
	  <style type="text/css">
		body {
			font-family: Arial, Helvetica, sans-serif;
			font-size: 14px;
			color: #000000;
			}
		h2 {
			font-size: 1.5em;
			color: #000099;
			}
		.hilight {
			color: #FF0000;
			}
		.hilight2 {
			color: #000099;
			}
		.hilight3 {
			color: #0000FF;
			}
		.heading {
			color: #FFFF00;
			background-color: #0000FF;
			}
		.center  {
			text-align: center;
			}
	</style>
  </head>
<body>
<table border="0" cellspacing="0" cellpadding="6">
    <tr><td colspan="7"><h2>Customer Information</h2></td></tr>
<tr class="heading">
    <td>Position</td>
    <td>Number</td>
    <td>Name</td>
    <td>State</td>
    <td align="right">Zip/Mail Code</td>
</tr>
<xsl:for-each select="customers/customer">
     <xsl:sort select="address/zip" />
	<tr>
	    	<td class="hilight"><xsl:number value="position()" format="I" /></td>
	    	<td><xsl:value-of select="number"/></td>
    		<td><xsl:value-of select="name"/></td>
			<td><xsl:value-of select="address/state"/></td>
    		<td class="center"><xsl:value-of select="address/zip"/></td>
	</tr>
</xsl:for-each>
	<tr>
		<td colspan="5">
			<hr color="blue"/>
		</td>
	</tr>
	<tr>
		<td colspan="5">
			The last customer is: <xsl:value-of select="last()"/>
		</td>
	</tr>
	<tr>
		<td colspan="5">
			The number of customers is: <xsl:value-of select="count(customers/customer)"/>
		</td>
	</tr>
	<tr>
		<td colspan="5">
			The number of customers with a zip code starting with '9' is: <xsl:value-of select="count(customers/customer/address[substring(zip,1,1)=9])"/>
		</td>
	</tr>
	<tr>
		<td colspan="5">
			The number of customers in California is: <xsl:value-of select="count(customers/customer/address[state='CA'])"/>
		</td>
	</tr>

	<xsl:apply-templates select="customers/customer/address[state='WI']"/> 
	<xsl:apply-templates select="customers/customer/name"/> 
	
</table>
</body>
</html>
</xsl:template>
<xsl:template match="customer/address">
	<tr>
		<td colspan="5">
			The last customer in Wisconsin is: <xsl:value-of select="last()"/>
		</td>
	</tr>
</xsl:template>
<xsl:template match="customer/name">
	<tr>
		<xsl:if test ="position()='1'">
		<td colspan="5">
			The last customer is: <xsl:value-of select="last()"/>
		</td>
		</xsl:if>
	</tr>
</xsl:template>
</xsl:stylesheet>