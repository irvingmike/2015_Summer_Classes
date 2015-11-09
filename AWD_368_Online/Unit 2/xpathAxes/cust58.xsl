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
			font-size: 1.2em;
			color: #000099;
			}
		.hilight {
			color: #FF0000;
			}
		.floatLeft {
		    float:left;
		    width:40%;
		    border-style:ridge;
		    border-width:2px;
		    border-color:#006DD3;
		    margin-right:2em;
		}
	</style>
  </head>
<body>
    <div class="floatLeft">
	    <table border="0" cellspacing="4" cellpadding="4">
	    <tr><td colspan="2"><h2>Alphabetic Customer Cities</h2></td></tr>
        <xsl:apply-templates select="customers/customer/address/city[not(.=preceding::customer/address/city)]">
	    <xsl:sort select="." /> 
	</xsl:apply-templates>
	    </table>
	</div>
    <div class="floatLeft">
	    <table border="0" cellspacing="4" cellpadding="4">
	    <tr><td colspan="2"><h2>Customer Cities By State</h2></td></tr>
	    <xsl:apply-templates select="customers/customer/address/city[not(.=preceding::customer/address/city)]" mode="byState">
	    <xsl:sort select="../state" />
            <xsl:sort select="." />
	    </xsl:apply-templates>
		</table>
	</div>

</body>
</html>
</xsl:template>

<xsl:template match="city">
<tr>
    <td><xsl:value-of select="."/></td>
    <td><xsl:value-of select="../state"/></td>
</tr>
</xsl:template>

<xsl:template match="city" mode="byState">
<tr>
    <td><xsl:value-of select="../state"/></td>
	<td><xsl:value-of select="."/></td>
</tr>
</xsl:template>

</xsl:stylesheet>