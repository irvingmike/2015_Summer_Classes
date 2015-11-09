<?xml version="1.0" encoding="utf-8"?>
<!-- 
Text Encoding Initiative Consortium XSLT stylesheet family
$Date: 2004/11/15 14:47:46 $, $Revision: 1.1 $, $Author: edankert $

XSL stylesheet to format TEI XML documents to HTML or XSL FO

 
Copyright 1999-2003 Sebastian Rahtz / Text Encoding Initiative Consortium
    This is an XSLT stylesheet for transforming TEI (version P4) XML documents

    Version 3.1. Date Thu May  6 23:25:11 BST 2004

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.
                                                                                
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
                                                                                
    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
                                                                                
    The author may be contacted via the e-mail address

    sebastian.rahtz@computing-services.oxford.ac.uk--> 
<xsl:stylesheet
  xmlns:tei="http://www.tei-c.org/ns/1.0"
 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:saxon="http://icl.com/saxon"
    xmlns:exsl="http://exslt.org/common"
    exclude-result-prefixes="saxon exsl" 
    extension-element-prefixes="exsl saxon"
    version="1.1">

<xsl:template name="outputChunk">
 <xsl:param name="ident"/>
 <xsl:param name="content"/>
 <xsl:variable name="outName">
 <xsl:choose>
  <xsl:when test="not($outputDir ='')">
    <xsl:value-of select="$outputDir"/>
    <xsl:if test="not(substring($outputDir,string-length($outputDir),string-length($outputDir))='/')">
      <xsl:text>/</xsl:text>
    </xsl:if>
    <xsl:value-of select="concat($ident,'.html')"/>
 </xsl:when>
 <xsl:when test="contains($processor,'SAXON 6')">
   <xsl:variable name="baseName">
    <xsl:value-of 
       xmlns:saxon="http://icl.com/saxon"  
       select="substring-after(saxon:system-id(),':')"/>
   </xsl:variable>
   <xsl:variable name="base">
   <xsl:call-template name="get-basename">
     <xsl:with-param name="file">
      <xsl:value-of select="$baseName"/>
    </xsl:with-param>
   </xsl:call-template>
 </xsl:variable>
 <xsl:value-of 
       xmlns:saxon="http://icl.com/saxon"  
   select="substring-before($baseName,concat($base,'.xml'))"/>
    <xsl:value-of select="concat($ident,'.html')"/>
  </xsl:when>
  <xsl:otherwise>
    <xsl:value-of select="concat($ident,'.html')"/>
  </xsl:otherwise>
  </xsl:choose>
  </xsl:variable>
  <xsl:choose>
  <xsl:when test="$ident=''">
        <xsl:copy-of select="$content"/>     
  </xsl:when>
  <xsl:when test="element-available('exsl:document')">
  <xsl:if test="$verbose='true'">
<xsl:message>Opening <xsl:value-of select="$outName"/> with exsl:document</xsl:message></xsl:if>
      <exsl:document         
        encoding="{$outputEncoding}" 
        method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN" href="{$outName}">
        <xsl:copy-of select="$content"/>
      </exsl:document> 
<xsl:if test="$verbose='true'">
<xsl:message>Closing file <xsl:value-of select="$outName"/></xsl:message>
</xsl:if>
    </xsl:when>
  <xsl:when test="element-available('xsl:document')">
  <xsl:if test="$verbose='true'">
<xsl:message>Opening <xsl:value-of select="$outName"/> with xsl:document</xsl:message></xsl:if>
      <xsl:document encoding="{$outputEncoding}" 
               method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN" href="{$outName}">
        <xsl:copy-of select="$content"/>
      </xsl:document> 
<xsl:if test="$verbose='true'">
<xsl:message>Closing file <xsl:value-of select="$outName"/></xsl:message>
</xsl:if>
    </xsl:when>
  <xsl:when test="contains($processor,'SAXON 6')">
  <xsl:if test="$verbose='true'"><xsl:message>Opening <xsl:value-of select="$outName"/> with Saxon 6</xsl:message></xsl:if>
      <saxon:output encoding="{$outputEncoding}" 
               method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN" file="{$outName}" href="{$outName}">
        <xsl:copy-of select="$content"/>
      </saxon:output> 
<xsl:if test="$verbose='true'">
<xsl:message>Closing file <xsl:value-of select="$outName"/></xsl:message>
</xsl:if>
  </xsl:when>
  <xsl:when test="contains($processor,'SAXON 5')">
  <xsl:if test="$verbose='true'"><xsl:message>Opening <xsl:value-of select="$outName"/> with Saxon 5</xsl:message></xsl:if>
      <saxon:output encoding="{$outputEncoding}" 
               method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN" file="{$outName}" href="{$outName}">
        <xsl:copy-of select="$content"/>
      </saxon:output> 
<xsl:if test="$verbose='true'">
<xsl:message>Closing file <xsl:value-of select="$outName"/></xsl:message>
</xsl:if>
  </xsl:when>
  <xsl:when test="contains($processor,'Apache')">
  <xsl:if test="$verbose='true'"><xsl:message>Opening <xsl:value-of select="$outName"/>  with Xalan</xsl:message></xsl:if>
      <xalan:write 
        xsl:extension-element-prefixes="xalan"
        xmlns:xalan="org.apache.xalan.xslt.extensions.Redirect"
        file="{$outName}">
        <xsl:copy-of select="$content"/>
      </xalan:write>
<xsl:if test="$verbose='true'">
<xsl:message>Closing file <xsl:value-of select="$outName"/></xsl:message>
</xsl:if>
  </xsl:when>
  <xsl:otherwise>
      <xsl:if test="$verbose='true'">
      <xsl:message>Creation of <xsl:value-of select="$outName"/> not possible with <xsl:value-of select="$processor"/></xsl:message>
      </xsl:if>
    <xsl:copy-of select="$content"/>
  </xsl:otherwise>
  </xsl:choose>

</xsl:template>

</xsl:stylesheet>
