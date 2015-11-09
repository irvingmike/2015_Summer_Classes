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
	}
.caption {
	font-weight: 700;
	}
</style>
</head>
<body>
<p class="title">Customer Names</p>

<xsl:apply-templates select="customers"/>

</body>
</html>
</xsl:template>

<xsl:template match="customers">
    <xsl:apply-templates select ="customer"/>
</xsl:template>

<xsl:template match="customer">
    <br/>
	<xsl:value-of select="name"/>
        <xsl:value-of select="address/country"/>
</xsl:template>
</xsl:stylesheet>