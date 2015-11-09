<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
  
<head>
<title> XML Customer Information </title>
<style type="text/css">
		body {
			font-family: Arial, Helvetica, sans-serif;
			font-size: 14px;
			color: #0000FF;
			}
		h2 {
			font-size: 1.5em;
			color: #000099;
			}
		.hilight {
			color: #FF0000;
			}
		.heading {
			color: #FFFF00;
			background-color: #0000FF;
			}
	</style>
</head>
<body>
<table border="0" cellspacing="0" cellpadding="4">
    <tr><td colspan="7"><h2>Customer Information</h2></td></tr>
<tr class="heading">
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
<tr>
    <td><xsl:value-of select="number"/></td>
    <td><xsl:value-of select="name"/></td>
    <td><xsl:value-of select="address/street"/></td>
    <td><xsl:value-of select="address/city"/></td>
    <td><xsl:value-of select="address/state"/></td>
    <td><xsl:value-of select="address/zip"/></td>
    <td align="right" class="hilight"><xsl:value-of select="balance"/></td>
</tr>
    </xsl:for-each>
</table>
</body>
</html>
</xsl:template>
</xsl:stylesheet>