<?xml version='1.0' ?>

<!--
  Student Name: Aaron Anderson
  Project 2.2
  Date: 07/15/2015
-->

<xsl:stylesheet version='1.0' xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>

<xsl:template match='/'>

    <html>
        <head>
            <title>Project 2.2</title>
            <style>
                body {
                    font-family: Arial, sans-serif;
                    color: #0000FF;
                }

                table {
                    width: 50em;
                    padding: 0;

                    border-collapse: collapse;

                    border: 1px solid #000000;

                }

                td {
                    width: 33%;
                }

                td.header {
                    background-color: #000000;
                    color: #FFFF00;
                    padding: .1em;
                }

                td.total {
                    color: #FF0000;
                }

                .bold {
                    font-weight: 600;
                }

                .center {
                    text-align: center;
                }

                .spacer {
                    height: 2em;
                }
            </style>
        </head>
        <body>
            <table>
                <tr>
                    <td colspan='3' class='header center'><span class='bold'>Exchange Information</span></td>
                </tr>
                <tr>
                    <td class='header'>Exchange Type</td>
                    <td class='header'>Name (Last, First, Middle)</td>
                    <td class='header'>Country Choice</td>
                </tr>
                <xsl:for-each select='exchanges/exchange'>
                    <tr>
                        <xsl:choose>
                            <xsl:when test='@classification="S"'>
                                <td>Student</td>
                            </xsl:when>
                            <xsl:when test='@classification="T"'>
                                <td>Teacher</td>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:apply-templates select='name' />
                        <td><xsl:value-of select='countryChoice[@preference="1"]' /></td>
                    </tr>
                </xsl:for-each>
                <tr>
                    <td class='spacer' colspan='3'> </td>
                </tr>
                <tr>
                    <td colspan='2' class='total'>The number of people applying for an exchange is:</td>
                    <td class='total'><xsl:value-of select='count(exchanges/exchange)' /></td>
                </tr>
                <tr>
                    <td colspan='2'>The number of teachers applying for an exchange is:</td>
                    <td><xsl:value-of select='count(exchanges/exchange[@classification="T"])' /></td>
                </tr>
                <tr>
                    <td colspan='2'>The number of students applying for an exchange is:</td>
                    <td><xsl:value-of select='count(exchanges/exchange[@classification="S"])' /></td>
                </tr>
            </table>
        </body>
    </html>
</xsl:template>

<xsl:template match='name'>
    <td>
        <xsl:value-of select='concat(nameLast, ", ", nameFirst, ", ", nameMiddleInitial)' />
    </td>
</xsl:template>

</xsl:stylesheet>