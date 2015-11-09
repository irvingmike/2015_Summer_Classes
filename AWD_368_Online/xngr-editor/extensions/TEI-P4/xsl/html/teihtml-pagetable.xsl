<!-- 
Text Encoding Initiative Consortium XSLT stylesheet family
$Date: 2004/11/15 14:47:47 $, $Revision: 1.1 $, $Author: edankert $

XSL stylesheet to format TEI XML documents to HTML or XSL FO

 
Copyright 1999-2003 Sebastian Rahtz / Text Encoding Initiative Consortium
    This is an XSLT stylesheet for transforming TEI (version P4) XML documents

    Version 3.1. Date Thu May  6 23:25:12 BST 2004

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
  version="1.0"  >

<xsl:template name="doPageTable">
 <xsl:param name="currentID"/>
 <xsl:variable name="BaseFile">
   <xsl:value-of select="$masterFile"/>
   <xsl:call-template name="addCorpusID"/>
 </xsl:variable>

 <xsl:call-template name="outputChunk">
   <xsl:with-param name="ident">
     <xsl:choose>
       <xsl:when test="$STDOUT='true'"/>
       <xsl:when test="not($currentID='')">
         <xsl:value-of select="$currentID"/>
       </xsl:when>
       <xsl:otherwise>
         <xsl:value-of select="$BaseFile"/>         
       </xsl:otherwise>
     </xsl:choose>
   </xsl:with-param>
   <xsl:with-param name="content">
    <xsl:call-template name="tableFrame">       
      <xsl:with-param name="currentID" select="$currentID"/>
    </xsl:call-template>
  </xsl:with-param>
 </xsl:call-template>
</xsl:template>

<xsl:template name="tableFrame">
<xsl:param name="currentID"/>
<xsl:param name="content"/>
<html><xsl:call-template name="addLangAtt"/>
 <xsl:comment>THIS FILE IS GENERATED FROM AN XML MASTER. 
              DO NOT EDIT</xsl:comment>
 <head>
   <xsl:variable name="pagetitle">
     <xsl:choose>
      <xsl:when test="$currentID=''">
          <xsl:call-template name="generateTitle"/>
      </xsl:when>
      <xsl:otherwise>
          <xsl:call-template name="generateTitle"/>:
        <xsl:choose>
          <xsl:when test="count(key('IDS',$currentID))&gt;0">
             <xsl:for-each select="key('IDS',$currentID)">  
                <xsl:apply-templates select="." mode="header"/>
             </xsl:for-each>
          </xsl:when>
          <xsl:otherwise>
           <xsl:apply-templates select="descendant::text" mode="xpath">
               <xsl:with-param name="xpath" select="$currentID" />
               <xsl:with-param name="action" select="'header'" />
           </xsl:apply-templates>
         </xsl:otherwise>
       </xsl:choose>
      </xsl:otherwise>
     </xsl:choose>
   </xsl:variable>
     <title><xsl:value-of select="$pagetitle"/></title>
 <xsl:call-template name="includeCSS"/>
 <xsl:call-template name="metaHook">
   <xsl:with-param name="title" select="$pagetitle"/>
 </xsl:call-template>
 <xsl:call-template name="javaScript"/>
 </head>
 <body  class="pagetable" >
  <xsl:call-template name="bodyHook"/>
  <xsl:call-template name="bodyJavaScript"/>

  <xsl:call-template name="startHeader"/>

 <table border="0">
   <tr>
     <td align="left" valign="top" rowspan="2" width="{$linksWidth}" class="linktext">
       <xsl:call-template name="leftHandFrame">
         <xsl:with-param name="currentID" select="$ID"/>
       </xsl:call-template>
     </td>
     <td  valign="top">
      <xsl:call-template name="generateSubTitle"/>
      <h2 class="maintitle"><xsl:call-template name="generateTitle"/></h2>
     </td>
     <td valign="top">
       <xsl:call-template name="searchbox"/>
     </td>
   </tr>
   <tr>
    <td  valign="top" class="maintext" colspan="2">
     <xsl:choose>
         <xsl:when test="$currentID='#'">
            <xsl:copy-of select="$content"/>
          </xsl:when>
          <xsl:otherwise>
           <xsl:call-template name="mainFrame">
            <xsl:with-param name="currentID" select="$currentID"/>
           </xsl:call-template>
          </xsl:otherwise>
      </xsl:choose>
     </td>
   </tr>
  </table>
  <xsl:call-template name="endFooter"/>
 </body>
</html>
</xsl:template>

<xsl:template name="endFooter"/>

<xsl:template name="startHeader"/>

<xsl:template match="*" mode="paging">

  <xsl:choose>
     <xsl:when test="self::divGen[@type='summary']">
           <xsl:call-template name="summaryToc"/>
     </xsl:when>
     <xsl:when test="self::divGen">
       <xsl:apply-templates select="."/>
     </xsl:when>
     <xsl:when test="starts-with(name(),'div')">
      <xsl:if test="not(preceding-sibling::*) or preceding-sibling::titlePage">
           <h2><xsl:apply-templates select="." mode="header"/></h2>
           <xsl:call-template name="doDivBody"/>
           <xsl:call-template name="printDivnotes"/>
                <xsl:if test="$bottomNavigationPanel='true'">
                 <xsl:call-template name="xrefpanel">
                  <xsl:with-param name="homepage" 
                   select="concat($masterFile,$standardSuffix)"/>
                  <xsl:with-param name="mode" select="name(.)"/>
                 </xsl:call-template>
                </xsl:if>
      </xsl:if>
     </xsl:when>
     <xsl:otherwise>
       <xsl:apply-templates select="."/>
       <xsl:apply-templates select="following-sibling::*[1]" mode="paging"/>
     </xsl:otherwise>    
  </xsl:choose>

</xsl:template>


<xsl:template name="leftHandFrame">
  <xsl:param name="currentID"/>
     <xsl:call-template name="logoFramePicture"/>
     <br/>
     <xsl:if test="$feedbackURL">
     <a target="_top" href="{$feedbackURL}" class="frametoc">
        <xsl:call-template name="feedbackWords"/></a>
     <br/>
     </xsl:if>

     <hr/>
     <xsl:choose>
      <xsl:when test="$currentID=''">
         <xsl:call-template name="linkListContents">
           <xsl:with-param name="style" select="'frametoc'"/>
         </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:choose>
          <xsl:when test="count(key('IDS',$currentID))&gt;0">
             <xsl:for-each select="key('IDS',$currentID)">  
               <xsl:call-template name="linkListContents">
                 <xsl:with-param name="style" select="'frametoc'"/>
               </xsl:call-template>
             </xsl:for-each>
          </xsl:when>
          <xsl:otherwise>
           <xsl:apply-templates select="descendant::text" mode="xpath">
               <xsl:with-param name="xpath" select="$currentID" />
               <xsl:with-param name="action" select="'toclist'" />
           </xsl:apply-templates>
        </xsl:otherwise>
       </xsl:choose>
      </xsl:otherwise>
     </xsl:choose>
</xsl:template>

<xsl:template name="mainFrame">
 <xsl:param name="currentID"/>
       <xsl:choose>
      <xsl:when test="$currentID=''">
   <!-- we need to locate the first interesting object in the file, ie
    the first grandchild of <text > -->
      <xsl:for-each select=" descendant::text/*[1]/*[1]">
        <xsl:apply-templates select="." mode="paging"/>


        <xsl:if test="following-sibling::div/head and not(ancestor-or-self::TEI.2[@rend='nomenu'])">
          <xsl:call-template name="contentsHeading"/>
          <ul class="toc">
              <xsl:apply-templates 
                select="following-sibling::div" mode="maketoc">
                <xsl:with-param name="forcedepth" select="'0'"/>
              </xsl:apply-templates>
          </ul>
        </xsl:if>
      </xsl:for-each>
      </xsl:when>
      <xsl:otherwise>
        <xsl:choose>
          <xsl:when test="count(key('IDS',$currentID))&gt;0">
             <xsl:for-each select="key('IDS',$currentID)">  
                <h2><xsl:apply-templates select="." mode="header"/></h2>
                <xsl:call-template name="doDivBody"/>
		<xsl:call-template name="printDivnotes"/>
                <xsl:if test="$bottomNavigationPanel='true'">
                 <xsl:call-template name="xrefpanel">
                  <xsl:with-param name="homepage" 
                   select="concat($masterFile,$standardSuffix)"/>
                  <xsl:with-param name="mode" select="name(.)"/>
                 </xsl:call-template>
                </xsl:if>
             </xsl:for-each>
          </xsl:when>
          <xsl:otherwise>
           <!-- the passed ID is a pseudo-XPath expression
            which starts below TEI/text.
            The real XPath syntax is changed to avoid problems
            -->
           <xsl:apply-templates select="ancestor-or-self::TEI.2/descendant::text" mode="xpath">
               <xsl:with-param name="xpath" select="$currentID" />
           </xsl:apply-templates>
        </xsl:otherwise>
       </xsl:choose>
      </xsl:otherwise>
     </xsl:choose>
     <xsl:call-template name="stdfooter">
          <xsl:with-param name="date">
           <xsl:call-template name="generateDate"/>
          </xsl:with-param>
          <xsl:with-param name="author">
            <xsl:call-template name="generateAuthorList"/>
          </xsl:with-param>
          <xsl:with-param name="style" select="'framestdlink'"/>
      </xsl:call-template>
</xsl:template>
</xsl:stylesheet>

