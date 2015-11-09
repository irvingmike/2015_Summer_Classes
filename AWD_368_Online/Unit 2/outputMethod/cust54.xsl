<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" version="1.0" indent="yes" encoding="iso-8859-1" />
<xsl:template match="/">
<!-- Create the root element -->
    <xsl:element name="itemsSold">
	<xsl:comment>This document includes all items for each customer order</xsl:comment>
        <xsl:apply-templates select="customers/customer"/>
    </xsl:element>
</xsl:template>

<!-- Create items sold on orders for each customer order by looping through all orders and all items for each customer -->
<xsl:template match="customer">
    <xsl:for-each select="order">
	<xsl:for-each select="item">
        <!-- Define the parent element orderItem -->
        <xsl:element name="orderItem">
            <xsl:attribute name="orderItemId">
	            <xsl:value-of select="concat('I',format-number(concat(../order_number,item_number),'00000000000000'))" />
	    </xsl:attribute>			
	   <xsl:element name="itemNumber">
	           <xsl:value-of select="item_number"/>
           </xsl:element>

           <xsl:element name="customerNumber">
                <xsl:value-of select="substring(../../@NUMBER,2)"/>
           </xsl:element>
	    <xsl:element name="orderNumber">
	           <xsl:value-of select="../order_number"/>
           </xsl:element>

	   <xsl:element name="itemQuantity">
	           <xsl:value-of select="quantity"/>
           </xsl:element>
	   <xsl:element name="itemPrice">
	           <xsl:value-of select="price"/>
           </xsl:element>
	   <xsl:element name="extendedAmount">
	           <xsl:value-of select="format-number(quantity*price,'########0.00')"/>
           </xsl:element>
	       <xsl:element name="shippingUnit">
	           <xsl:value-of select="quantity/@unit"/>
           </xsl:element>
        </xsl:element>
        </xsl:for-each>
	<!-- End of Item -->

    </xsl:for-each>
    <!-- End of Order -->

<!-- End of Customer -->
</xsl:template>
</xsl:stylesheet>