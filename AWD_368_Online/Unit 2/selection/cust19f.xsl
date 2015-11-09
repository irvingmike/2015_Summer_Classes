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
.caption {
	font-weight: 700;
	}
</style>
</head>
<body>
<table border="0" cellspacing="3" cellpadding="3">
    <tr>
        <td class="title">Customer Name</td>
        <td class="title">Comment</td>
    </tr>
    <tr><td colspan="2"><img src="bluefade.gif" border="0"/></td></tr>

<xsl:for-each select="customers/customer[comment()]">

    <tr>
        <td><xsl:value-of select="name"/></td>
		<xsl:for-each select="comment()|name/comment()">
        	<td><xsl:value-of select="."/></td>
		</xsl:for-each>
	</tr>

</xsl:for-each>
</table>
</body>
</html>
</xsl:template>
</xsl:stylesheet>