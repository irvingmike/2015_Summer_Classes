<?xml version="1.0" ?>
<!--
    Student Name: Aaron Anderson
    LAB 5.1
    07/06/2015
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <title>
                    XML Node Exercise
                </title>
            </head>
            <body style="font-family:Arial, Helvetica, sans-serif;font-size:12pt; color:blue">
                <xsl:apply-templates select="customers"></xsl:apply-templates>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="customers">                                     <!--Point 1  -->
        <table border="1" cellspacing="4" cellpadding="8">
            <tr>
                <td colspan="6" style="font-family:Arial, Helvetica, sans-serif;font-size:1.5em; color:navy">Customer Information</td></tr>
            <tr>
                <td colspan="4" align="center"><b>Full Name</b></td>
                <td><b>Country</b></td>
                <td><b>City</b></td>
                <td><b>Customer Since</b></td>
            </tr>
            <xsl:apply-templates select="customer"></xsl:apply-templates>
        </table>
    </xsl:template>

    <xsl:template match="customer">                                      <!--  Point 2  -->
        <tr>
            <xsl:apply-templates select="name"></xsl:apply-templates>
        </tr>
    </xsl:template>

    <xsl:template match="name">                                          <!--  Point 3  -->
        <xsl:apply-templates select="lastname"></xsl:apply-templates>
        <td><xsl:value-of select="firstname"/></td>
        <td><xsl:value-of select="middle_initial"/></td>
        <td><xsl:value-of select="../address/country"/></td> <!--  Point 4  -->
        <td><xsl:value-of select="../address/locality/city"/></td> <!--  Point 5  -->
        <td align="center"><xsl:value-of select="../created_date/year"/></td> <!--  Point 6  -->
    </xsl:template>

    <xsl:template match="lastname">                                      <!--  Point 7  -->
        <xsl:apply-templates select="@prefix"></xsl:apply-templates>     <!--  Point 8  -->
        <td><xsl:value-of select="."/></td> <!--  Point 9  -->
    </xsl:template>

    <xsl:template match="@prefix">       <!--  Point 10  -->
       <td><xsl:value-of select="."/></td> <!--  Point 11  -->
    </xsl:template>

</xsl:stylesheet>