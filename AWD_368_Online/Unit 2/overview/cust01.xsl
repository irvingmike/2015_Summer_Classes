<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
  <head>
    <title>
      <xsl:value-of select="customers/title" />
    </title>
  </head>
  <body style="font-family:Arial, Helvetica, sans-serif;font-size:12pt; color:blue">
    <p style="font-size:1.5em; color:navy">
      <xsl:value-of select="customers/title" />
    </p>
  <xsl:for-each select="customers/customer">
    <p>
      <strong>Number: </strong>
      <xsl:value-of select="number" />
    </p>
    <p>
      <strong>First Name: </strong>
      <xsl:value-of select="name/firstname" />
    </p>
    <p>
      <strong>Last Name: </strong>
      <xsl:value-of select="name/lastname" />
    </p>
    <p>
      <strong>Street: </strong>
      <xsl:value-of select="address/street" />
    </p>
    <p>
      <strong>Apartment: </strong>
      <xsl:value-of select="address/apartment" />
    </p>
    <p>
      <strong>City: </strong>
      <xsl:value-of select="address/city" />
    </p>
    <p>
      <strong>State: </strong>
      <xsl:value-of select="address/state" />
    </p>
    <p>
      <strong>Zip: </strong>
      <xsl:value-of select="address/zip" />
    </p>
    <p>
      <strong>Country: </strong>
      <xsl:value-of select="address/country" />
    </p>
    <p>
      <strong>Current Balance: </strong>
      <xsl:value-of select="current_balance" />
    </p>
  </xsl:for-each>
  </body>
</html>
</xsl:template>
</xsl:stylesheet>