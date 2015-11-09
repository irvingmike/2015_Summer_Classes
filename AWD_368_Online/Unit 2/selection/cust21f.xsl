<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
<head>
<title>XML Customer Names</title>
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

    <tr><td colspan="6" class="title">Customer Names</td></tr>
    <tr><td class="caption">Country</td>
    <td colspan="4" class="caption">Full Name</td>
    <td class="caption">Notes</td>
</tr>
<xsl:for-each select="customers/customer[address/country='Japan']|customers/customer[address/country='United States']">
    <tr>
        <td><xsl:value-of select="address/country"/></td>
        <td><xsl:value-of select="name/lastname/@prefix"/></td>
        <td><xsl:value-of select="name/firstname"/></td>
        <td><xsl:value-of select="name/middle_initial"/></td>
        <td><xsl:value-of select="name/lastname"/></td>
        <td><xsl:value-of select="notes"/></td>
    </tr>
</xsl:for-each>
</table>
</body>
</html>
</xsl:template>
</xsl:stylesheet>