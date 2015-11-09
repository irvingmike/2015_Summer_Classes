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
			color: #0000FF;
			}
		h2 {
			font-size: 2em;
			color: #000099;
			}
		.hilight {
			color: #FF0000;
			}
	</style>
  </head>
<body>
<table border="0" cellspacing="4" cellpadding="4">
    <tr><td colspan="4"><h2>Customer Information</h2></td></tr>

    <xsl:apply-templates select="customers/customer">
	<xsl:sort select="address/zip" /> 
	</xsl:apply-templates>
</table>
</body>
</html>
</xsl:template>

<xsl:template match="customers/customer">
<tr>
    <td><xsl:value-of select="number"/></td>
    <td><xsl:value-of select="name/lastname"/></td>
    <td><xsl:value-of select="name/middle_initial"/></td>
    <td><xsl:value-of select="name/firstname"/></td>
    <td><xsl:value-of select="address/street"/></td>
    <td><xsl:value-of select="address/city"/></td>
    <td><xsl:value-of select="address/state"/></td>
    <td class="hilight"><xsl:value-of select="address/zip"/></td>
    <td><xsl:value-of select="address/country"/></td>
    <td align="right"><xsl:value-of select="current_balance"/></td>
</tr>
</xsl:template>
</xsl:stylesheet>