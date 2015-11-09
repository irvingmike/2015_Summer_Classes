<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="text" />
<xsl:template match="customers">
<xsl:for-each select="customer">
<xsl:value-of select="format-number(string(position()), '000000')" />
<xsl:value-of select="substring(concat(name/lastname, '                    '), 1, 20)" />
<xsl:value-of select="substring(concat(name/firstname, '               '), 1, 15)" />
<xsl:value-of select="substring(concat(name/middle_initial, ' '), 1, 1)" />
<xsl:value-of select="substring(concat(address/street, '                    '), 1, 20)" />
<xsl:value-of select="substring(concat(address/city, '                    '), 1, 20)" />
<xsl:value-of select="substring(concat(address/state, '                    '), 1, 20)" />
<xsl:value-of select="substring(concat(address/zip, '          '), 1, 10)" />
<xsl:value-of select="substring(concat(address/country, '                        '), 1, 24)" />
<xsl:value-of select="format-number(created_date/month, '00')" />
<xsl:value-of select="format-number(created_date/day, '00')" />
<xsl:value-of select="format-number(created_date/year, '0000')" />
<xsl:value-of select="format-number(purchase_date/month, '00')" />
<xsl:value-of select="format-number(purchase_date/day, '00')" />
<xsl:value-of select="format-number(purchase_date/year, '0000')" />
<xsl:value-of select="format-number(payment_date/month, '00')" />
<xsl:value-of select="format-number(payment_date/day, '00')" />
<xsl:value-of select="format-number(payment_date/year, '0000')" />
<xsl:value-of select="format-number(translate(current_balance, ',', ''), '000000.00')" />
<xsl:text>
</xsl:text>
</xsl:for-each>
</xsl:template>
</xsl:stylesheet>