<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
<head>
<title>XPATH Examples</title>
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
	font-color:navy;
	}
.red {
	color:red;
}
.eoc {
	color:yellow;
	background-color:navy;
}
</style>
</head>
<body>
<table border="0" cellspacing="3" cellpadding="3">
    <tr>
        <td colspan="2" class="title">XPATH Examples</td>
    </tr>
    <tr><td colspan="2"><img src="bluefade.gif" border="0"/></td></tr>

<xsl:for-each select="customers/customer">

    <tr>
        <td>Name</td>
        <td><xsl:value-of select="name"/></td>
    </tr>
    <tr>
        <td colspan="2"><img src="spacer.gif" vspace="10"/></td>
    </tr>

    <tr>
        <td class="caption">Address descendant</td>
        <td><xsl:value-of select="descendant::address"/></td>
    </tr>
    <tr>    
        <td>Code for above</td>
	<td class="red">descendant::address</td>
    </tr>
    <tr>
        <td colspan="2"><img src="spacer.gif" vspace="10"/></td>
    </tr>


    <tr>
        <td class="caption">Address child</td>
        <td><xsl:value-of select="child::address"/></td>
    </tr>
    <tr>    
        <td>Code for above</td>
	<td class="red">child::address</td>
    </tr>
    <tr>
        <td colspan="2"><img src="spacer.gif" vspace="10"/></td>
    </tr>


    <tr>
        <td class="caption">Child of locality</td>
        <td><xsl:value-of select="child::address/locality"/></td>
    </tr>
    <tr>
        <td>Code for above</td>
	<td class="red">child::address/locality</td>
    </tr>
    <tr>
        <td colspan="2"><img src="spacer.gif" vspace="10"/></td>
    </tr>


    <tr>
        <td class="caption">Last name of next customer</td>
        <td><xsl:value-of select="following-sibling::customer/name/lastname"/></td>
    </tr>
    <tr>
        <td>Code for above</td>
	<td class="red">following-sibling::customer/name/lastname</td>
    </tr>
   <tr>
        <td colspan="2"><img src="spacer.gif" vspace="10"/></td>
    </tr>


   <tr>
        <td class="caption">Name descendant</td>
        <td><xsl:value-of select="descendant::name"/></td>
    </tr>
    <tr>
        <td>Code for above</td>
	<td class="red">descendant::name</td>
    </tr>
   <tr>
        <td colspan="2"><img src="spacer.gif" vspace="10"/></td>
    </tr>


   <tr class="eoc">
        <td colspan="2">End of Customer</td>
    </tr>

</xsl:for-each>
</table>
</body>
</html>
</xsl:template>
</xsl:stylesheet>