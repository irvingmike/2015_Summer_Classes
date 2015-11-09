<?xml version="1.0" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/TR/WD-xsl">
<xsl:template match="/">
<html>
<head>
<title>XML Customer Information</title>
<style type="text/css">
body {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 16px;
	color: #0000FF;
	}
.title {
	font-size: 1.5em;
	color: #000099;
	text-align:center;
	}
.caption {
	font-weight: 700;
	}
</style>
</head>
<body>
<table border="0" cellspacing="4" cellpadding="4">
    <tr><td colspan="4" class="title">Customer Information</td></tr>

    <xsl:for-each select="customers/customer" order-by="number">
<tr>
    <td><xsl:value-of select="number"/></td>
    <td><xsl:value-of select="name/lastname"/></td>
    <td><xsl:value-of select="name/middle_initial"/></td>
    <td><xsl:value-of select="name/firstname"/></td>
    <td><xsl:value-of select="address/street"/></td>
    <td><xsl:value-of select="address/city"/></td>
    <td><xsl:value-of select="address/state"/></td>
    <td><xsl:value-of select="address/zip"/></td>
    <td><xsl:value-of select="address/country"/></td>
    <td align="right"><xsl:value-of select="current_balance"/></td>
</tr>
    </xsl:for-each>
</table>
</body>
</html>
</xsl:template>
</xsl:stylesheet>