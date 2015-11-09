<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" version="1.0" indent="yes" />
<xsl:template match="/">
<html>
<head>
    <title>Order and Item Counts</title>
</head>
<body>
<p>Order and Item Counts</p>
<p>Total number of items: <xsl:value-of select="count(//itemNumber)" /></p>
<p>Sum of item quantity: <xsl:value-of select="sum(//itemQuantity)" /></p>
<p>Value of goods sold: <xsl:value-of select="format-number(sum(//extendedAmount),'###,##0.00')" /></p>
</body>
</html>
</xsl:template>

</xsl:stylesheet>