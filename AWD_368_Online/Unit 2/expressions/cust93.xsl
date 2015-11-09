<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
<head>
<title>XML ID Transformation Example</title>
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
.hilight {
	font-weight: 900;
	color:#aa0300;
	}

.eoc {
	color: #ffff00;
	background-color:black;
	font-weight: 700;
	text-align:center;
}
</style>
</head>
<body>
<table border="0" cellspacing="3" cellpadding="3">
    <tr>
        <td colspan="4" class="title">Customer Order Information</td>
     </tr>
    <tr><td colspan="4"><img src="bluefade.gif" border="0"/></td></tr>

<xsl:for-each select="customers/customer">

    <tr>
        <td class="hilight"><xsl:number value="position()" format="I" /></td>
	<td>Name</td>
        <td colspan="3"><xsl:value-of select="name"/></td>
    </tr>
    <tr>
        <td>&#160;</td>
	<td>ID Number</td>
        <td colspan="3"><xsl:value-of select="@NUMBER"/></td>
    </tr>
    <tr>
        <td>&#160;</td>
        <td>Address</td>
        <td colspan="3"><xsl:value-of select="address"/></td>
    </tr>

    <xsl:for-each select="order">
        <tr>
	    <td colspan="2" align="right" class="hilight"><xsl:number value="position()" format="A" /></td>
            <td>Order Number</td>
            <td colspan="2"><xsl:value-of select="order_number"/></td>
        </tr>
        <tr>
	    <td colspan="2" align="right">&#160;</td>
            <td>Order Date</td>
            <td colspan="2"><xsl:value-of select="order_date"/></td>
        </tr>


        <xsl:for-each select="item">
            <tr>
                <td colspan="2" >&#160;</td>
                <td align="right" class="hilight"><xsl:number value="position()" format="i" /></td>
                <td>Item Number</td>
                <td><xsl:value-of select="item_number"/></td>
            </tr>
            <tr>
                <td colspan="3">&#160;</td>
                <td>Quantity</td>
                <td><xsl:value-of select="quantity"/></td>
            </tr>
            <tr>
                <td colspan="3">&#160;</td>
                <td>Unit</td>
                <td><xsl:value-of select="quantity/@unit"/></td>
            </tr>
            <tr>
                <td colspan="3">&#160;</td>
                <td>Price</td>
                <td><xsl:value-of select="price"/></td>
            </tr>
            <tr>
                <td colspan="3">&#160;</td>
                <td colspan="2"><hr color="blue"/></td>
            </tr>
	</xsl:for-each>
	<!-- End of Item -->
        <tr>
            <td><img src="spacer.gif" border="0"/></td>
            <td colspan="4"><hr color="green"/></td>
        </tr>

    </xsl:for-each>
    <!-- End of Order -->
    <tr>
        <td colspan="4">Account Balance</td>
        <td><xsl:value-of select="current_balance"/></td>
    </tr>
    <tr>
        <td colspan="5" class="eoc">End of Customer</td>
    </tr>
    <tr>
            <td colspan="5"><img src="spacer.gif" height="10" border="0"/></td>
    </tr>

</xsl:for-each>
<!-- End of Customer -->
</table>
</body>
</html>
</xsl:template>
</xsl:stylesheet>