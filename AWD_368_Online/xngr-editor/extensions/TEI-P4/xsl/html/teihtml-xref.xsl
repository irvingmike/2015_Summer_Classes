<!-- 
Text Encoding Initiative Consortium XSLT stylesheet family
$Date: 2004/11/15 14:47:47 $, $Revision: 1.1 $, $Author: edankert $

XSL stylesheet to format TEI XML documents to HTML or XSL FO

 
Copyright 1999-2003 Sebastian Rahtz / Text Encoding Initiative Consortium
    This is an XSLT stylesheet for transforming TEI (version P4) XML documents

    Version 3.1. Date Thu May  6 23:25:13 BST 2004

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
  exclude-result-prefixes="tei"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:param name="overrideMasterFile"></xsl:param>
<!-- cross-referencing -->

<!-- work out an ID for a given <div> -->
 <xsl:template match="*" mode="ident">
 <xsl:variable name="BaseFile">
 <xsl:value-of select="$masterFile"/>
 <xsl:call-template name="addCorpusID"/>
</xsl:variable>
  <xsl:choose>
  <xsl:when test="@id">
    <xsl:choose>
     <xsl:when test="$useIDs">
       <xsl:value-of select="@id"/>
     </xsl:when>
     <xsl:otherwise>
      <xsl:value-of select="$BaseFile"/>-<xsl:value-of select="name(.)"/>-<xsl:value-of select="generate-id()"/>
     </xsl:otherwise>
    </xsl:choose>
  </xsl:when>
  <xsl:when test="self::div and not(ancestor::div)"> 
  <xsl:variable name="xpath">
       <xsl:for-each select="ancestor-or-self::*">
    <xsl:value-of select="name()" />
    <xsl:text />.<xsl:number />
    <xsl:if test="position() != last()">_</xsl:if>
  </xsl:for-each>
  </xsl:variable>
   <xsl:value-of select="substring-after($xpath,'TEI.2.1_text.1_')"/>
  </xsl:when>
  <xsl:when test="self::divGen"> 
  <xsl:variable name="xpath">
       <xsl:for-each select="ancestor-or-self::*">
    <xsl:value-of select="name()" />
    <xsl:text />.<xsl:number />
    <xsl:if test="position() != last()">_</xsl:if>
  </xsl:for-each>
  </xsl:variable>
  <xsl:value-of select="substring-after($xpath,'TEI_.1_text.1_')"/>
  </xsl:when>
  <xsl:otherwise>
   <xsl:value-of select="$BaseFile"/>-<xsl:value-of select="name(.)"/>-<xsl:value-of select="generate-id()"/>
  </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- when a <div> is referenced, see whether its  plain anchor, 
 or needs a parent HTML name prepended -->


<xsl:template match="TEI.2" mode="xrefheader">
  <xsl:variable name="BaseFile">
    <xsl:value-of select="$masterFile"/>
    <xsl:call-template name="addCorpusID"/>
  </xsl:variable>
  <xsl:value-of select="concat($BaseFile,$standardSuffix)"/>
</xsl:template>

<xsl:template match="*" mode="xrefheader">
  <xsl:variable name="ident">
    <xsl:apply-templates select="." mode="ident"/>
  </xsl:variable>
  <xsl:variable name="depth">
    <xsl:apply-templates select="." mode="depth"/>
  </xsl:variable>
  <xsl:variable name="Hash">
    <xsl:choose>
      <xsl:when test="$makeFrames='true' and not($STDOUT='true')">
	<xsl:value-of select="$masterFile"/>
	<xsl:call-template name="addCorpusID"/>
	<xsl:text>.html</xsl:text>
      </xsl:when>
      <xsl:otherwise>
	<xsl:value-of select="$overrideMasterFile"/>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>#</xsl:text>
  </xsl:variable>
  <xsl:choose>
    <xsl:when test="$rawIE='true' and $depth &lt;= $splitLevel">
      <xsl:text>JavaScript:void(gotoSection('','</xsl:text>
      <xsl:value-of select="$ident"/>
      <xsl:text>'));</xsl:text>
    </xsl:when>
    <xsl:when test="$STDOUT='true' and $depth &lt;= $splitLevel">
      <xsl:value-of select="$masterFile"/>
      <xsl:value-of select="$urlChunkPrefix"/>
      <xsl:value-of select="$ident"/>
    </xsl:when>
    <xsl:when test="ancestor::back and not($splitBackmatter)">
      <xsl:value-of select="concat($Hash,$ident)"/>
    </xsl:when>
    <xsl:when test="ancestor::front and not($splitFrontmatter)">
      <xsl:value-of select="concat($Hash,$ident)"/>
    </xsl:when>
    <xsl:when test="$splitLevel= -1 and ancestor::teiCorpus.2">
      <xsl:value-of select="$masterFile"/>
      <xsl:call-template name="addCorpusID"/>
      <xsl:value-of select="$standardSuffix"/>
      <xsl:value-of select="concat($Hash,$ident)"/>
    </xsl:when>
    <xsl:when test="$splitLevel= -1">
      <xsl:value-of select="concat($Hash,$ident)"/>
    </xsl:when>
    <xsl:when test="$depth &lt;= $splitLevel">
      <xsl:value-of select="concat($ident,$standardSuffix)"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:variable name="parent">
	<xsl:call-template name="locateParentdiv"/>
      </xsl:variable>
      <xsl:choose>
	<xsl:when test="$rawIE='true'">
	  <xsl:text>JavaScript:void(gotoSection("</xsl:text>
	  <xsl:value-of select="$ident"/>
	  <xsl:text>","</xsl:text>
	  <xsl:value-of select="$parent"/>
	  <xsl:text>"));</xsl:text>
	</xsl:when>
	<xsl:when test="$STDOUT='true'">
	  <xsl:value-of select="$masterFile"/>
	  <xsl:text>.ID=</xsl:text>
	  <xsl:value-of select="$parent"/>
	  <xsl:value-of select="concat($standardSuffix,'#')"/>
	  <xsl:value-of select="$ident"/>
	</xsl:when>
	<xsl:otherwise>
	  <xsl:value-of select="$parent"/>
	  <xsl:value-of select="concat($standardSuffix,'#')"/>
	  <xsl:value-of select="$ident"/>
	</xsl:otherwise>
      </xsl:choose>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="locateParentdiv">
 <xsl:choose>
  <xsl:when test="ancestor-or-self::div and $splitLevel &lt; 0">
     <xsl:apply-templates
     select="ancestor::div[last()]" mode="ident"/>
  </xsl:when>
  <xsl:when test="ancestor-or-self::div">
  <xsl:apply-templates
     select="ancestor::div[last() - $splitLevel]" mode="ident"/>
  </xsl:when>
  <xsl:otherwise>
   <xsl:choose>
    <xsl:when test="$splitLevel = 0">
      <xsl:apply-templates select="ancestor::div1|ancestor::div0" mode="ident"/>
    </xsl:when>
    <xsl:when test="$splitLevel = 1">
      <xsl:apply-templates select="(ancestor::div2|ancestor::div1|ancestor::div0)[last()]" mode="ident"/>
    </xsl:when>
    <xsl:when test="$splitLevel = 2">
      <xsl:apply-templates select="(ancestor::div3|ancestor::div2)[last()]" mode="ident"/>
    </xsl:when>
    <xsl:when test="$splitLevel = 3">
      <xsl:apply-templates select="(ancestor::div4|ancestor::div3)[last()]" mode="ident"/>
    </xsl:when>
    <xsl:when test="$splitLevel = 4">
      <xsl:apply-templates select="(ancestor::div5|ancestor::div4)[last()]" mode="ident"/>
    </xsl:when>
   </xsl:choose>
  </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="locateParent">
  <xsl:choose>
  <xsl:when test="self::div">
  <xsl:apply-templates
     select="ancestor::div[last() - $splitLevel + 1]" mode="ident"/>
  </xsl:when>
  <xsl:when test="ancestor::div">
  <xsl:apply-templates
     select="ancestor::div[last() - $splitLevel]" mode="ident"/>
  </xsl:when>
  <xsl:otherwise>
   <xsl:choose>
    <xsl:when test="$splitLevel = 0">
      <xsl:apply-templates select="ancestor::div1|ancestor::div0" mode="ident"/>
    </xsl:when>
    <xsl:when test="$splitLevel = 1">
      <xsl:apply-templates select="ancestor::div2|ancestor::div1|ancestor::div0" mode="ident"/>
    </xsl:when>
    <xsl:when test="$splitLevel = 2">
      <xsl:apply-templates select="ancestor::div3|ancestor::div2" mode="ident"/>
    </xsl:when>
    <xsl:when test="$splitLevel = 3">
      <xsl:apply-templates select="ancestor::div4|ancestor::div3" mode="ident"/>
    </xsl:when>
    <xsl:when test="$splitLevel = 4">
      <xsl:apply-templates select="ancestor::div5|ancestor::div4" mode="ident"/>
    </xsl:when>
   </xsl:choose>
  </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="ref">
  <xsl:call-template name="makeHyperLink">     
    <xsl:with-param name="url">
      <xsl:apply-templates mode="xrefheader" select="key('IDS',@target)"/>
    </xsl:with-param>
    <xsl:with-param name="class">
     <xsl:choose>
      <xsl:when test="@rend"><xsl:value-of select="@rend"/></xsl:when>
      <xsl:otherwise><xsl:value-of select="$class_ref"/></xsl:otherwise>     
      </xsl:choose>
    </xsl:with-param>
    <xsl:with-param name="body">
      <xsl:apply-templates/>
    </xsl:with-param>
  </xsl:call-template>
</xsl:template>

<xsl:template match="anchor">
   <a name="{@id}"/>
</xsl:template>

<xsl:template match="note" mode="xrefheader">
    <xsl:text>#Note</xsl:text>
    <xsl:call-template name="noteID"/>
</xsl:template>


<xsl:template match="label|figure|table|item|p|bibl|anchor|cell|lg|list|sp" 
  mode="xrefheader">
  <xsl:variable name="ident">
   <xsl:apply-templates select="." mode="ident"/>
  </xsl:variable>
 <xsl:variable name="file">
 <xsl:apply-templates 
   select="ancestor::*[starts-with(name(),'div')][1]"  
   mode="xrefheader"/>
 </xsl:variable>
 <xsl:choose>
  <xsl:when test="starts-with($file,'#')">
    <xsl:text>#</xsl:text><xsl:value-of select="$ident"/>
  </xsl:when>
  <xsl:when test="contains($file,'#')">
    <xsl:value-of select="substring-before($file,'#')"/>
    <xsl:text>#</xsl:text><xsl:value-of select="$ident"/>
  </xsl:when>
  <xsl:otherwise>
    <xsl:value-of select="$file"/>
    <xsl:text>#</xsl:text><xsl:value-of select="$ident"/>
  </xsl:otherwise>
 </xsl:choose>
</xsl:template>

<xsl:template match="ptr">
  <xsl:call-template name="makeHyperLink">     
    <xsl:with-param name="url">
      <xsl:apply-templates mode="xrefheader" select="key('IDS',@target)"/>
    </xsl:with-param>
    <xsl:with-param name="class">
     <xsl:choose>
      <xsl:when test="@rend"><xsl:value-of select="@rend"/></xsl:when>
      <xsl:otherwise><xsl:value-of select="$class_ptr"/></xsl:otherwise>     
     </xsl:choose>
    </xsl:with-param>
<xsl:with-param name="body">
 <xsl:variable name="xx">
  <xsl:apply-templates mode="header" select="key('IDS',@target)">
    <xsl:with-param name="minimal" select="$minimalCrossRef"/>
 </xsl:apply-templates>
 </xsl:variable>
 <xsl:value-of select="normalize-space($xx)"/>
</xsl:with-param>
  </xsl:call-template>
</xsl:template>

<xsl:template match="xref">
 <xsl:variable name="url">
    <xsl:call-template name="lookupURL"/>
 </xsl:variable>
  <xsl:call-template name="makeHyperLink">     
    <xsl:with-param name="url"><xsl:value-of select="$url"/></xsl:with-param>
    <xsl:with-param name="class">
     <xsl:choose>
      <xsl:when test="@rend"><xsl:value-of select="@rend"/></xsl:when>
      <xsl:otherwise><xsl:value-of select="$class_quicklink"/></xsl:otherwise>     
     </xsl:choose>
    </xsl:with-param>
<xsl:with-param name="body">
 <xsl:apply-templates/>
</xsl:with-param>
  </xsl:call-template>
</xsl:template>

<xsl:template match="xptr">
  <xsl:variable name="url">
    <xsl:call-template name="lookupURL"/>
  </xsl:variable>
  <xsl:variable name="URL">
    <xsl:choose>
     <xsl:when test="starts-with($url,'mailto:')">
     <xsl:value-of select="substring-after($url,'mailto:')"/>
     </xsl:when>
     <xsl:when test="starts-with($url,'file:')">
      <xsl:value-of select="substring-after($url,'file:')"/>
     </xsl:when>
     <xsl:otherwise>
     <xsl:value-of select="$url"/>
     </xsl:otherwise>
     </xsl:choose>
    </xsl:variable>
  <xsl:call-template name="makeHyperLink">     
   <xsl:with-param name="url"><xsl:value-of select="$url"/></xsl:with-param>
   <xsl:with-param name="class">
    <xsl:choose>
     <xsl:when test="@rend"><xsl:value-of select="@rend"/></xsl:when>
     <xsl:otherwise><xsl:value-of select="$class_quicklink"/></xsl:otherwise>
    </xsl:choose>
  </xsl:with-param>
<xsl:with-param name="body">
  <xsl:element name="{$fontURL}">
    <xsl:value-of select="$URL"/>
   </xsl:element>
</xsl:with-param>
  </xsl:call-template>
</xsl:template>

<xsl:template name="lookupURL">
  <xsl:choose>
    <xsl:when test="@url"><xsl:value-of select="@url"/></xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="unparsed-entity-uri(@doc)"/>
      <xsl:choose>
        <xsl:when test="contains(@from,'id (')">
          <xsl:text>#</xsl:text>
           <xsl:value-of select="substring(@from,5,string-length(normalize-space(@from))-1)"/>
        </xsl:when>
      </xsl:choose>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="makeAnchor">
  <xsl:if test="@id"><a name="{@id}"/></xsl:if>  
</xsl:template>

<xsl:template name="makeHyperLink">    
  <xsl:param name="url"/>
  <xsl:param name="class"/>
  <xsl:param name="body"/>
  <a><xsl:attribute name="href">
    <xsl:value-of select="$url"/>
  </xsl:attribute>
  <xsl:attribute name="class">
    <xsl:value-of select="$class"/>
  </xsl:attribute>
  <xsl:choose>
   <xsl:when test="@rend='noframe'">
     <xsl:attribute name="target">_top</xsl:attribute>
   </xsl:when>
   <xsl:when test="@rend='new'">
     <xsl:attribute name="target">_blank</xsl:attribute>
   </xsl:when>
   <xsl:when test="contains($url,'://') or starts-with($url,'.') or starts-with($url,'/')">
     <xsl:attribute name="target">_top</xsl:attribute>
   </xsl:when>
   <xsl:when test="substring($url,string-length($url),1)='/'">
     <xsl:attribute name="target">_top</xsl:attribute>
   </xsl:when>
   <xsl:when test="$splitLevel=-1">
     <xsl:attribute name="target">_top</xsl:attribute>
   </xsl:when>
  </xsl:choose>
  <!-- link title from "n" attribute -->
  <xsl:if test="@n">
    <xsl:attribute name="title">
     <xsl:value-of select="@n"/>
    </xsl:attribute> 
  </xsl:if>
   <!-- deal with extra attributes -->
  <xsl:call-template name="xrefHook"/>
    <xsl:copy-of select="$body"/>
  </a>
</xsl:template>
</xsl:stylesheet>
