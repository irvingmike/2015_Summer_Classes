<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="text" />
<xsl:template match="customers">
<xsl:for-each select="customer">
<xsl:value-of select="concat(substring('000000', 1, 6 - string-length(number)),number)" />
<xsl:text></xsl:text>
<xsl:value-of select="substring(concat(name/lastname, '                    '), 1, 20)" />
<xsl:text></xsl:text>
<xsl:value-of select="substring(concat(name/firstname, '               '), 1, 15)" />
<xsl:text></xsl:text>
<xsl:value-of select="substring(concat(name/middle_initial,' '), 1, 1)" />
<xsl:text></xsl:text>

<xsl:value-of select="substring(concat(address/street, '                    '), 1, 20)" />
<xsl:text></xsl:text>
<xsl:value-of select="substring(concat(address/city, '                    '), 1, 20)" />
<xsl:text></xsl:text>
<xsl:value-of select="substring(concat(address/state, '                    '), 1, 20)" />
<xsl:text></xsl:text>
<xsl:value-of select="substring(concat(address/zip, '          '), 1, 10)" />
<xsl:text></xsl:text>
<xsl:value-of select="substring(concat(address/country, '                        '), 1, 24)" />
<xsl:text></xsl:text>
<xsl:value-of select="format-number(created_date/month, '00')" />
<xsl:text></xsl:text>
<xsl:value-of select="format-number(created_date/day, '00')" />
<xsl:text></xsl:text>
<xsl:value-of select="created_date/year" />
<xsl:text></xsl:text>
<xsl:value-of select="format-number(purchase_date/month, '00')" />
<xsl:text></xsl:text>
<xsl:value-of select="format-number(purchase_date/day, '00')" />
<xsl:text></xsl:text>
<xsl:value-of select="purchase_date/year" />
<xsl:text></xsl:text>
<xsl:value-of select="format-number(payment_date/month, '00')" />
<xsl:text></xsl:text>
<xsl:value-of select="format-number(payment_date/day, '00')" />
<xsl:text></xsl:text>
<xsl:value-of select="payment_date/year" />
<xsl:text></xsl:text>
<xsl:value-of select="format-number(current_balance, '000000.00')" />
<xsl:text></xsl:text>
<xsl:text>&#x0D;&#x0A;</xsl:text>
</xsl:for-each>
</xsl:template>
</xsl:stylesheet>