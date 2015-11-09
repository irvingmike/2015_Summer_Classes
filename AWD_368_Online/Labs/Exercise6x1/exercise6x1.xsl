<?xml version="1.0" ?>
<!-- Student Name: Aaron Anderson -->
<!-- EXERCISE 6.1                 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
<head>
	<title>Movie Collection</title>
    <link href="exercise6x1.css" rel="stylesheet" type="text/css" />

</head>

<body>

	<p class="title">Movie Collection</p>

	<table cellpadding="4" cellspacing="0">

		<xsl:apply-templates select="movies/movie">
			<!--apply sorting here, must go within opening and closing apply-templates -->
		</xsl:apply-templates>

	</table>
</body>
</html>
</xsl:template>

<xsl:template match="movies/movie">

	<!--add rating -->

    <tr>
		<td class="caption">Title</td>
        <td>
            <xsl:value-of select="title"></xsl:value-of>
        </td>
    </tr>

		<!--add director -->
		<!--add releaseDate -->
		<!--add director -->
		<!--add type -->


	<tr>
		<td class="caption">Genre</td>
		<td>
			<!--add logic to call the looping logic for displaying all of the genres -->

		</td>
	</tr>

    <tr>
        <td colspan="2">
            <hr />
        </td>
    </tr>


</xsl:template>

<!--add template-match logic to loop throughop for displaying all of the genres -->

</xsl:stylesheet>