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
        <td colspan="2" class="title">Customer Order Information</td>
    </tr>
    <tr><td colspan="2"><img src="bluefade.gif" border="0"/></td></tr>

<xsl:for-each select="customers/customer">

    <tr>
        <td>Name</td>
        <td><xsl:value-of select="name"/></td>
    </tr>
    <tr>
        <td>ID Number</td>
        <td><xsl:value-of select="@NUMBER"/></td>
    </tr>
    <tr>
        <td>Country</td>
        <td><xsl:value-of select="address/country"/></td>
    </tr>
    <tr>
        <td colspan="2"><img src="spacer.gif" vspace="10"/></td>
    </tr>

    <tr>
        <td class="caption">Order child 1</td>
        <td><xsl:value-of select="child::order[position()=1]"/></td>
    </tr>
    <tr>    
        <td colspan="2">Code for above <span class="red">child::order[position()=1]</span></td>
    </tr>
    <tr>
        <td colspan="2"><img src="spacer.gif" vspace="10"/></td>
    </tr>

    <tr>
        <td class="caption">Last Order child</td>
        <td><xsl:value-of select="child::order[position()=last()]"/></td>
    </tr>
    <tr>    
        <td colspan="2">Code for above <span class="red">child::order[position()=last()]</span></td>
    </tr>
    <tr>
        <td colspan="2"><img src="spacer.gif" vspace="10"/></td>
    </tr>

    <tr>
        <td class="caption">First Item child</td>
        <td><xsl:value-of select="child::order/item[position()=1]"/></td>
    </tr>
    <tr>
        <td colspan="2">Code for above <span class="red">child::order/item[position()=1]</span></td>
    </tr>
    <tr>
        <td colspan="2"><img src="spacer.gif" vspace="10"/></td>
    </tr>

    <tr>
        <td class="caption">First order of next customer</td>
        <td><xsl:value-of select="following-sibling::customer/order"/></td>
    </tr>
    <tr>
        <td colspan="2">Code for above <span class="red">following-sibling::customer/order</span></td>
    </tr>
   <tr>
        <td colspan="2"><img src="spacer.gif" vspace="10"/></td>
    </tr>

   <tr>
        <td class="caption">Second order of next customer</td>
        <td><xsl:value-of select="following-sibling::customer/order[position()=2]"/></td>
    </tr>
    <tr>
        <td colspan="2">Code for above <span class="red">following-sibling::customer/order[position()=2]</span></td>
    </tr>
   <tr>
        <td colspan="2"><img src="spacer.gif" vspace="10"/></td>
    </tr>

    <tr>
        <td class="caption">Descendant of Order</td>
        <td><xsl:value-of select="descendant::order"/></td>
    </tr>
    <tr>
        <td colspan="2">Code for above <span class="red">descendant::order</span></td>
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