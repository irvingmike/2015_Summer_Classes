<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
<head>
<title>XML Customers With Apartments</title>
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
.lightblue {
	background-color:lightblue;
	color:navy;
	font-weight: 700;
}
.indigo {
	background-color:indigo;
	color:yellow;
}
</style>
</head>
<body>
<xsl:apply-templates select="customers"/>
</body>
</html>
</xsl:template>

<xsl:template match="customers">
    <table border="0" cellspacing="0" cellpadding="8">

    <tr><td colspan="9" class="title">Customers With Apartments</td></tr>
    <xsl:apply-templates select="customer"/>

    </table>
</xsl:template>

<xsl:template match="customer">
<tr>
    <xsl:apply-templates select="address[apartment]"/>
</tr>
</xsl:template>


<xsl:template match="address[apartment]">
    <td class="lightblue"><xsl:value-of select="../name/firstname"/></td>
    <td class="lightblue"><xsl:value-of select="../name/middle_initial"/></td>
    <td class="lightblue"><xsl:value-of select="../name/lastname"/></td>
    <td class="indigo"><xsl:value-of select="street"/></td>
    <td class="indigo"><xsl:value-of select="apartment"/></td>
    <td class="indigo"><xsl:value-of select="city"/></td>
    <td class="indigo"><xsl:value-of select="state"/></td>
    <td class="indigo"><xsl:value-of select="zip"/></td>
    <td class="indigo"><xsl:value-of select="country"/></td>
</xsl:template>

</xsl:stylesheet>