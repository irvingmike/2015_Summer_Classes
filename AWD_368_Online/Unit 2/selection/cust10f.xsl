<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">

<html>
    <head>
        <title>XML Customer Names</title>
        <style type="text/css">
            body {
                font-family: Arial, Helvetica, sans-serif;
                font-size: 16px;
                color: #0000FF;
            }
            .title {
                font-size: 1.5em;
                color: #000099;
            }
        </style>
    </head>
    <body>
        <p class="title">Customer Names</p>

        <xsl:for-each select="customers/customer">
            <br/>
            <xsl:value-of select="name" />
        </xsl:for-each>
    </body>
</html>

</xsl:template>
</xsl:stylesheet>