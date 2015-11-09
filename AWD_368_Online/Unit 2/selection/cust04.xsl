<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text" />

<xsl:template match="/">
    <xsl:for-each select="customers/customer">
        <xsl:value-of select="number" />
        /<xsl:value-of select="name/firstname" />
        /<xsl:value-of select="name/lastname" />
        /<xsl:value-of select="address/street" />
        /<xsl:value-of select="address/apartment" />
        /<xsl:value-of select="address/city" />
        /<xsl:value-of select="address/state" />
        /<xsl:value-of select="address/zip" />
        /<xsl:value-of select="address/country" />
        /<xsl:value-of select="current_balance" />
    </xsl:for-each>
</xsl:template>

</xsl:stylesheet>