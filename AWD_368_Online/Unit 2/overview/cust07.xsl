<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
   
<head>
<title> <xsl:value-of select="customers/title" /> </title>
<script language="JavaScript">
	 <xsl:value-of select="customers/jscript" />
      </script>

<style type="text/css">
body {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 16px;
	color: #0000FF;
	}
h2 {
	font-size: 2em;
	color: #000099;
	}
.caption {
	font-weight: 700;
	}
</style>
</head>
<body onLoad="welcome();">
   <h2>
      <xsl:value-of select="customers/title" />
   </h2>
   <table>
      <xsl:for-each select="customers/customer">
         <tr>
            <td class="caption">Number: </td>
            <td>
                <xsl:value-of select="number" />
            </td>
         </tr>
         <tr>
            <td class="caption">First Name: </td>
            <td>
                <xsl:value-of select="name/firstname" />
            </td>
         </tr>
         <tr>
            <td class="caption">Last Name: </td>
            <td>
                <xsl:value-of select="name/lastname" />
            </td>
         </tr>
         <tr>
            <td class="caption">Street: </td>
            <td>
                <xsl:value-of select="address/street" />
            </td>
         </tr>
         <tr>
            <td class="caption">Apartment: </td>
            <td>
                  <xsl:value-of select="address/apartment" />
            </td>
         </tr>
         <tr>
            <td class="caption">City: </td>
            <td>
                  <xsl:value-of select="address/city" />
            </td>
         </tr>
         <tr>
            <td class="caption">State: </td>
           <td>
                  <xsl:value-of select="address/state" />
           </td>
         </tr>
         <tr>
            <td class="caption">Zip: </td>
            <td>
                  <xsl:value-of select="address/zip" />
            </td>
         </tr>
         <tr>
            <td class="caption">Country: </td>
            <td>
                  <xsl:value-of select="address/country" />
            </td>
         </tr>
         <tr>
            <td class="caption">Current Balance: </td>
            <td>
                  <xsl:value-of select="current_balance" />
            </td>
         </tr>
         <tr>
            <td colspan="2"><hr/>         
            </td>
         </tr>
      </xsl:for-each>
   </table>
</body>
</html>
</xsl:template>
</xsl:stylesheet>