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
	font-size: 2em;
	color: #000099;
	text-align:center;
	}
.caption {
	font-weight: 700;
	}
</style>
</head>
<body>
<xsl:apply-templates select="customers"/>
</body>
</html>
</xsl:template>

<xsl:template match="customers">
    <table border="0" cellspacing="3" cellpadding="3">
    <tr><td colspan="3" class="title">Customer Names</td></tr>
    <tr><td colspan="3"><img src="bluefade.gif" border="0" width="100%"/></td></tr>
    <tr><td><img src="spacer.gif" width="1" height="1" border="0"/></td>
        <td class="caption">Name</td><td class="caption">Customer Address</td></tr>

    <xsl:apply-templates select ="customer/address"/>
    </table>
</xsl:template>

<xsl:template match="customer/address">
<tr><td><img src="bluebull.gif" border="0"/></td>
    <td><xsl:value-of select="../name"/></td>
    <td><xsl:value-of select="."/></td></tr>
</xsl:template>
</xsl:stylesheet>