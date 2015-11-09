<?xml version="1.0" ?>

<!--
  Student Name: Aaron Anderson
  LAB 8.1
  Date: 07/12/2015
-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:decimal-format name="dateMonthDay" NaN="00" />
<xsl:decimal-format name="dateYear" NaN="0000" />

<xsl:output method="xml" indent="yes" />

<xsl:template match="/">

    <xsl:element name="authorBooks">

        <xsl:comment> The document represents all authors and their books. </xsl:comment>

        <xsl:apply-templates select="books/book/author">
            <xsl:sort select="last" order="ascending" />
            <xsl:sort select="first" order="ascending" />
            <xsl:sort select="middle" order="ascending" />
        </xsl:apply-templates>

    </xsl:element>

</xsl:template>

<xsl:template match="books/book/author">
    <xsl:element name="authorBook">
        <xsl:attribute name="bookIsbn">
            <xsl:value-of select="translate(../isbn, '-', '')" />
        </xsl:attribute>
        <xsl:element name="authorName">
            <xsl:element name="lastName">
                <xsl:value-of select="last" />
            </xsl:element>
            <xsl:element name="middleInitial">
                <xsl:value-of select="middle" />
            </xsl:element>
            <xsl:element name="firstName">
                <xsl:value-of select="first" />
            </xsl:element>
        </xsl:element>
        <xsl:element name="bookTitle">
            <xsl:value-of select="../title" />
        </xsl:element>
        <xsl:element name="bookEdition">
            <xsl:value-of select="../edition" />
        </xsl:element>
        <xsl:element name="publishedDate">
                <xsl:call-template name="formatDate">
                   <xsl:with-param name="dateName" select="../publishedDate"/>
                </xsl:call-template>
        </xsl:element>
        <xsl:element name="bookCatagory">
            <xsl:value-of select="concat(translate(substring(../type,1,1), 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'), substring(../type,2))" />
        </xsl:element>
        <xsl:element name="bookFormat">
            <xsl:value-of select="../title/@type" />
        </xsl:element>
        <xsl:element name="currentPrice">
            <xsl:value-of select="../price" />
        </xsl:element>

    </xsl:element>
</xsl:template>

<xsl:template name="formatDate">
       <xsl:param name="dateName"/>
        <xsl:value-of select="format-number($dateName/month, '00', 'dateMonthDay')" />-<xsl:value-of select="format-number($dateName/day, '00', 'dateMonthDay')" />-<xsl:value-of select="format-number($dateName/year, '0000', 'dateYear')" />
</xsl:template>

</xsl:stylesheet>