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
			font-size: 2em;
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
		.yellowColor {
			color: #FFFF00;
			}
		.blueBack {
			background-color: #0000FF;
			}	
	</style>
  </head>
<body>
<table border="0" cellspacing="0" cellpadding="4">
    <tr><td colspan="7"><h2>Customer Information</h2></td></tr>
<tr class="blueBack">
    <td class="yellowColor">Number</td>
    <td class="yellowColor">Name</td>
    <td class="yellowColor">Street</td>
    <td class="yellowColor">City</td>
    <td class="yellowColor">State</td>
    <td class="yellowColor">Zip</td>
    <td align="right" class="yellowColor">Balance</td>
</tr>
    <xsl:apply-templates select="customers/customer">
    <xsl:sort select="address/state" /> 
    <xsl:sort select="address/zip" /> 
    <xsl:sort select="address/street" /> 
	</xsl:apply-templates>
</table>
</body>
</html>
</xsl:template>

<xsl:template match="customers/customer">
<tr>
    <td><xsl:value-of select="number"/></td>
    <td><xsl:value-of select="name"/></td>
    <td class="hilight3"><xsl:value-of select="address/street"/></td>
    <td><xsl:value-of select="address/city"/></td>
    <td class="hilight"><xsl:value-of select="address/state"/></td>
    <td class="hilight2"><xsl:value-of select="address/zip"/></td>
    <td align="right"><xsl:value-of select="balance"/></td>
</tr>
</xsl:template>
</xsl:stylesheet>