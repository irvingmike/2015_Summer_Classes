<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" version="1.0" indent="yes" />
<xsl:template match="/">
<!-- Create the root element -->
    <xsl:element name="customerOrders">
        <xsl:apply-templates select="customers/customer"/>
    </xsl:element>
</xsl:template>

<!-- Create orders for each customer by looping through all orders for each customer -->
<xsl:template match="customer">
    <xsl:for-each select="order">
        <xsl:element name="customerOrder">
        <!-- Define the parent element customerOrder -->
	
            <xsl:element name="customerNumber">
                <xsl:value-of select="../@NUMBER"/>
            </xsl:element>
		
            <xsl:element name="orderNumber">
                <xsl:value-of select="order_number"/>
            </xsl:element>
		
            <xsl:element name="orderDate">
                <xsl:value-of select="order_date"/>
            </xsl:element>
		
            <xsl:element name="orderStatus">
                <xsl:choose>
                    <xsl:when test="order_status='Shipped'">Order Has Shipped</xsl:when>
                    <xsl:when test="order_status='Backordered'">Backordered Order</xsl:when>
                    <xsl:when test="order_status='Received'">Order Has Been Received</xsl:when>
                    <xsl:when test="order_status='Warehouse'">Order Being Packaged</xsl:when>
                    <xsl:otherwise>Unknown Order Status</xsl:otherwise>
                </xsl:choose>
            </xsl:element>	

	 </xsl:element>
	<!-- End of customerOrder element -->
    </xsl:for-each>
    <!-- End of order for-each loop -->
</xsl:template>
<!-- End of customer template -->
</xsl:stylesheet>