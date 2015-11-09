<?xml version="1.0" ?>

<!--
  Student Name: Aaron Anderson
  LAB 7.1
  Date: 07/10/2015
  File Dependencies: lab7x1.css
-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:decimal-format name="nanErrorMessage" NaN="ERROR: Not a number"/>
    <xsl:decimal-format name="nanZeros" NaN="00"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Book Collection Lab 7.1</title>
                <link href="lab7x1.css" rel="stylesheet" type="text/css" />
            </head>
        <body>
            <p class="title">Book Collection</p>
            <xsl:apply-templates select="books/book">
                <xsl:sort select="price" order="ascending" data-type="number" />
            </xsl:apply-templates>
        </body>
        </html>
    </xsl:template>

    <xsl:template match="books/book">
        <table>
            <tr>
                <td><xsl:number value="position()" format="0001" /></td>
                <td><xsl:value-of select="format-number(price, '0.00', 'nanErrorMessage')"/></td>
            </tr>
            <tr>
                <td>ISBN: <xsl:value-of select="translate(isbn, '-', '')" /></td>
                <td><xsl:value-of select="substring(title, 1, 35)" /></td>
            </tr>
            <tr>
                <td>Ed: <xsl:value-of select="format-number(edition, '00', 'nanZeros')" /></td>
                <td>Pub Date: <xsl:value-of select="format-number(publishedDate/month, '00', 'nanZeros')" />/<xsl:value-of select="format-number(publishedDate/day, '00', 'nanZeros')" />/<xsl:value-of select="format-number(publishedDate/year, '0000', 'nanZeros')" /></td>
            </tr>
            <tr>
                <xsl:for-each select="author">
                    <xsl:sort select="last" order="ascending" />
                    <xsl:sort select="first" order="ascending" />
                    <xsl:sort select="middle" order="ascending" />
                    <td>
                        <xsl:value-of select="substring(concat(last, ', ', first, ' ', middle), 1, 30)" />
                    </td>
                </xsl:for-each>
            </tr>
        </table>
        <br/>
    </xsl:template>

</xsl:stylesheet>