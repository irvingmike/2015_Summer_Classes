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
   <p style="color:navy; font-size:2em">
      <xsl:value-of select="customers/title" />
   </p>
   <table>
      <xsl:for-each select="customers/customer">
         <tr>
            <td  style="font-weight:700">Number: </td>
            <td>
                  <xsl:value-of select="number" />
            </td>
         </tr>   
         <tr>
            <td  style="font-weight:700">
               First Name: 
            </td>
            <td>
                  <xsl:value-of select="name/firstname" />
            </td>
         </tr>
         <tr>
            <td  style="font-weight:700">
               Last Name: 
            </td>
            <td>
                  <xsl:value-of select="name/lastname" />
            </td>
         </tr>
         <tr>
            <td  style="font-weight:700">
               Street: 
            </td>
            <td>
                  <xsl:value-of select="address/street" />
            </td>
         </tr>
         <tr>
            <td  style="font-weight:700">
               Apartment: 
            </td>
            <td>
                  <xsl:value-of select="address/apartment" />
            </td>
         </tr>
         <tr>
            <td  style="font-weight:700">
               City: 
            </td>
            <td>
                  <xsl:value-of select="address/city" />
            </td>
         </tr>
         <tr>
            <td  style="font-weight:700">
               State: 
            </td>
           <td>
                  <xsl:value-of select="address/state" />
           </td>
         </tr>
         <tr>
            <td  style="font-weight:700">
               Zip: 
            </td>
            <td>
                  <xsl:value-of select="address/zip" />
            </td>
         </tr>
         <tr>
            <td  style="font-weight:700">
               Country: 
            </td>
            <td>
                  <xsl:value-of select="address/country" />
            </td>
         </tr>
         <tr>
            <td  style="font-weight:700">
               Current Balance: 
            </td>
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