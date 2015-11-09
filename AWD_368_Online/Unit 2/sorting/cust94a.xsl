<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
<head>
<title>Mulltiple sorting with templates</title>
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
.eoc {
	color: #ffff00;
	background-color:black;
	font-weight: 700;
	text-align:center;
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
    <tr>
        <td colspan="4" class="title">Customer Order Information</td>
     </tr>
    <tr><td colspan="4"><img src="bluefade.gif" border="0"/></td></tr>
	<xsl:apply-templates select ="customer">
		<xsl:sort select="name" /> 
	</xsl:apply-templates>
</table>
</xsl:template>

<xsl:template match="customer">

    <tr>
        <td>Name</td>
        <td colspan="3"><xsl:value-of select="name"/></td>
    </tr>
    <tr>
        <td>ID Number</td>
        <td colspan="3"><xsl:value-of select="@NUMBER"/></td>
    </tr>
    <tr>
        <td>Address</td>
        <td colspan="3"><xsl:value-of select="address"/></td>
    </tr>
	<xsl:apply-templates select="order">
		<xsl:sort select="order_date/year" data-type="number" order="descending"/>
		<xsl:sort select="order_date/month" data-type="number" order="descending"/>
		<xsl:sort select="order_date/day" data-type="number" order="descending"/>
	</xsl:apply-templates>
    <tr>
        <td colspan="3">Account Balance for <xsl:value-of select="name/firstname"/><xsl:text> </xsl:text><xsl:value-of select="name/lastname"/></td>
        <td><xsl:value-of select="current_balance"/></td>
    </tr>
    <tr>
        <td colspan="4" class="eoc">End of Customer</td>
    </tr>
    <tr>
        <td colspan="4"><img src="spacer.gif" height="10" border="0"/></td>
    </tr>
<!-- End of Customer Template -->
</xsl:template>
	

<xsl:template match="order">
    <tr>
	<td align="right"><img src="0004100n.gif" border="0"/></td>
        <td>Order Number</td>
        <td colspan="2"><xsl:value-of select="order_number"/></td>
    </tr>
    <tr>
	<td align="right"><img src="000k1002.gif" border="0"/></td>
        <td>Order Date</td>
        <td colspan="2"><xsl:value-of select="order_date"/></td>
    </tr>
	<xsl:apply-templates select ="item">
		<xsl:sort select="item_number" data-type="number"/>
	</xsl:apply-templates>
		<tr>
        <td><img src="spacer.gif" border="0"/></td>
        <td colspan="3"><hr color="green"/></td>
     </tr>
</xsl:template>
<!-- End of Order -->

<xsl:template match="item">
     <tr>
         <td><img src="spacer.gif" border="0"/></td>
         <td align="right"><img src="0000100n.gif" border="0"/></td>
         <td>Item Number</td>
         <td><xsl:value-of select="item_number"/></td>
     </tr>
     <tr>
         <td><img src="spacer.gif" border="0"/></td>
         <td align="right"><img src="0000100n.gif" border="0"/></td>
         <td>Quantity</td>
         <td><xsl:value-of select="quantity"/></td>
     </tr>
     <tr>
         <td><img src="spacer.gif" border="0" /></td>
         <td align="right"><img src="0000100n.gif" border="0"/></td>
         <td>Unit</td>
         <td><xsl:value-of select="quantity/@unit"/></td>
     </tr>
     <tr>
         <td><img src="spacer.gif" border="0"/></td>
         <td align="right"><img src="0000100n.gif" border="0"/></td>
          <td>Price</td>
          <td><xsl:value-of select="price"/></td>
      </tr>
      <tr>
          <td colspan="2"><img src="spacer.gif" border="0"/></td>
          <td colspan="2"><hr color="blue"/></td>
          </tr>
</xsl:template>
<!-- End of Item -->

</xsl:stylesheet>