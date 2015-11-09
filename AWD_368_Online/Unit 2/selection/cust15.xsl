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
<xsl:apply-templates select="customers"/>

</body>
</html>
</xsl:template>

<xsl:template match="customers">
    <table border="0" cellspacing="4" cellpadding="4">

    <tr><td colspan="4" class="title">Customer Names</td></tr>
    <tr><td colspan="4" class="caption">Full Name</td></tr>

    <xsl:apply-templates/>

    </table>
</xsl:template>
<xsl:template match="customer">
<tr>
    <xsl:apply-templates select="name"/>
</tr>
</xsl:template>

<xsl:template match="name">
    <td><xsl:value-of select="lastname/@prefix"/></td>
    <td><xsl:value-of select="firstname"/></td>
    <td><xsl:value-of select="middle_initial"/></td>
    <td><xsl:value-of select="lastname"/></td>
</xsl:template>

</xsl:stylesheet>