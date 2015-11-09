<?xml version="1.0" ?>

<!--
  Student Name: Aaron Anderson
  LAB 6.1
  Date: 07/07/2015
-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">

<html>

    <head>
        <title>Book Collection</title>
        <link href="lab6x1.css" rel="stylesheet" type="text/css" />
    </head>

    <body>
        <p class="title">Book Collection</p>
        <table cellpadding="4" cellspacing="0">
            <xsl:for-each select="books/book">
                <xsl:sort select="title/@type" order="descending" />
                <xsl:sort select="price" order="ascending" data-type="number"/>
                <tr>
                    <td>
                        ISBN
                    </td>
                    <td>
                        <xsl:value-of select="isbn" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Title
                    </td>
                    <td>
                        <xsl:value-of select="title"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        Edition
                    </td>
                    <td>
                        <xsl:value-of select="edition" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Published Date
                    </td>
                    <td>
                        <xsl:apply-templates select="publishedDate" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Type
                    </td>
                    <td>
                        <xsl:value-of select="type" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Cover Type
                    </td>
                    <td>
                        <xsl:apply-templates select="title" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Price
                    </td>
                    <td>
                        $<xsl:value-of select="price" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Author
                    </td>
                    <td>
                        <xsl:apply-templates select="author" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <hr />
                    </td>
                </tr>
            </xsl:for-each>
        </table>
    </body>

</html>

</xsl:template>

<xsl:template match="publishedDate">
    <xsl:value-of select="month" />/<xsl:value-of select="day" />/<xsl:value-of select="year" />
</xsl:template>

<xsl:template match="title">
    <xsl:value-of select="@type" />
</xsl:template>

<xsl:template match="author">
    <xsl:for-each select=".">
        <xsl:value-of select="last" />, <xsl:value-of select="first" /> <xsl:value-of select="middle" /><br />
    </xsl:for-each>
</xsl:template>

</xsl:stylesheet>