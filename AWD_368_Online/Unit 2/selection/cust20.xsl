<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
<head>
<title>XML ID Transformation Example</title>
<link href="xsltcommon.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<xsl:apply-templates select="customers"/>

</body>
</html>
</xsl:template>

<xsl:template match="customers">
<table border="0" cellspacing="3" cellpadding="3">
    <tr>
        <td colspan="4" class="title">Customer Information</td>
     </tr>
    <tr><td colspan="4"><img src="bluefade.gif" border="0"/></td></tr>
	<xsl:apply-templates select ="customer/address"/>
</table>
</xsl:template>

<xsl:template match="customer/address">

    <tr>
        <td>Name</td>
        <td colspan="3"><xsl:value-of select="../name"/></td>
    </tr>
    <tr>
        <td>ID Number</td>
        <td colspan="3"><xsl:value-of select="../@number"/></td>
    </tr>
    <tr>
        <td>Street</td>
        <td><xsl:value-of select="street"/></td>
		<xsl:apply-templates select ="apartment|suite|pobox"/>
    </tr>
    <tr>
        <td>City</td>
        <td><xsl:value-of select="city"/></td>
		<xsl:apply-templates select ="state|province|prefecture"/>
    </tr>
    <tr>
       <xsl:apply-templates select ="zip|mailingCode"/>
	   <td>Country</td>
       <td><xsl:value-of select="country"/></td>
    </tr>
    <tr>
        <td>Account Balance</td>
        <td colspan="3"><xsl:value-of select="../current_balance"/></td>
    </tr>
    <tr>
        <td colspan="4" class="eoc">End of Customer</td>
    </tr>
    <tr>
        <td colspan="4"><img src="spacer.gif" height="10" border="0"/></td>
    </tr>
<!-- End of Customer -->
</xsl:template>
	
<xsl:template match="apartment">
        <td>Apartment</td>
        <td><xsl:value-of select="."/></td>
</xsl:template>
<xsl:template match="suite">
        <td>Suite</td>
        <td><xsl:value-of select="."/></td>
</xsl:template>
<xsl:template match="pobox">
        <td>P.O. Box</td>
        <td><xsl:value-of select="."/></td>
</xsl:template>

<xsl:template match="state">
        <td>State</td>
        <td><xsl:value-of select="."/></td>
</xsl:template>
<xsl:template match="province">
        <td>Province</td>
        <td><xsl:value-of select="."/></td>
</xsl:template>
<xsl:template match="prefecture">
        <td>Prefecture</td>
        <td><xsl:value-of select="."/></td>
</xsl:template>

<xsl:template match="zip">
        <td>Zip Code</td>
        <td><xsl:value-of select="."/></td>
</xsl:template>
<xsl:template match="mailingCode">
        <td>Mailing Code</td>
        <td><xsl:value-of select="."/></td>
</xsl:template>


</xsl:stylesheet>