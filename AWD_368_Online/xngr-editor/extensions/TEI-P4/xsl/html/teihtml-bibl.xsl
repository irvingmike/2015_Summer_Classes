<?xml version="1.0" encoding="utf-8"?>
<!-- 
Text Encoding Initiative Consortium XSLT stylesheet family
XSL stylesheet to format TEI XML documents to HTML or XSL FO

This structured  bibliography handling comes from 
Peter Boot <pboot@attglobal.net>

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
  version="1.0">

<xsl:template match="biblStruct">
	<a name="{@id}"></a>
	<xsl:choose>
		<xsl:when test="@copyOf">
			<a class="biblink" href="{concat('#',substring(@copyOf,5,2))}">Zie <xsl:value-of select="substring(@copyOf,5,2)"/></a>
		</xsl:when>
		<xsl:otherwise>
			<xsl:choose>
				<xsl:when test="descendant::analytic">
					<br/><xsl:apply-templates select="analytic"/>
					<center>
					<table width="90%" border="0">
					<xsl:apply-templates select="monogr" mode="monograll"/>
					</table>
					</center>
				</xsl:when>
				<xsl:otherwise>
					<br/><xsl:apply-templates select="monogr" mode="monogrfirst"/>
					<center>
					<table width="90%" border="0">
					<xsl:apply-templates select="monogr" mode="monogrrest"/>
					</table>
					</center>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="analytic">
	<xsl:apply-templates select="author" mode="biblStruct"/>
	<i><xsl:apply-templates select="title[not(@type='short')]" mode="withbr"/></i>
</xsl:template>

<xsl:template match="monogr" mode="monograll">
	<tr><td>
		<xsl:choose>
			<xsl:when test="preceding-sibling::monogr">
				Also in:
			</xsl:when>
			<xsl:otherwise>
				In:
			</xsl:otherwise>
		</xsl:choose>
	</td></tr>
	<tr><td>
	<xsl:apply-templates select="author" mode="biblStruct"/>
	<i><xsl:apply-templates select="title" mode="withbr"/></i>
	<xsl:apply-templates select="respStmt"/>
	<xsl:apply-templates select="editor"/>
	<xsl:apply-templates select="edition"/>
	<xsl:apply-templates select="imprint"/>
	</td></tr>
	<tr><td>
	<xsl:apply-templates select="biblScope"/>
	</td></tr>
	<xsl:apply-templates select="following-sibling::series"/>
</xsl:template>

<xsl:template match="monogr" mode="monogrfirst">
	<xsl:apply-templates select="author" mode="biblStruct"/>
	<i><xsl:apply-templates select="title[not(@type='short')]" mode="withbr"/></i>
</xsl:template>

<xsl:template match="monogr" mode="monogrrest">
	<tr><td>
	<xsl:apply-templates select="respStmt"/>
	<xsl:apply-templates select="editor"/>
	<xsl:apply-templates select="edition"/>
	<xsl:apply-templates select="imprint"/>
	<xsl:if test="child::note">
		Zie noot: <xsl:apply-templates select="child::note"/>
	</xsl:if>
	</td></tr>
	<tr><td>
	<xsl:apply-templates select="biblScope"/>
	</td></tr>
	<xsl:apply-templates select="following-sibling::series"/>
</xsl:template>

<xsl:template match="series">
	<tr><td><xsl:apply-templates/></td></tr>
</xsl:template>

<xsl:template match="author" mode="biblStruct">
	<xsl:value-of select="name/@reg"/><xsl:for-each select="name[position()>1]">, <xsl:apply-templates/></xsl:for-each>.<br/>
</xsl:template>

<xsl:template match="author" mode="first">
	<xsl:value-of select="name/@reg"/>
	<xsl:if test="name[position()>1]"><xsl:text> (e.a.)</xsl:text></xsl:if><xsl:text>: </xsl:text>
</xsl:template>

<xsl:template match="editor" mode="first">
	<xsl:value-of select="name/@reg"/>
	<xsl:text> (ed.)</xsl:text>
	<xsl:if test="name[position()>1]"><xsl:text> (e.a.)</xsl:text></xsl:if><xsl:text>: </xsl:text>
</xsl:template>

<xsl:template match="imprint">
	<xsl:apply-templates select="biblScope"/>
	<xsl:apply-templates select="pubPlace"/>, 
	<xsl:apply-templates select="date"/>. <xsl:apply-templates select="publisher"/>
</xsl:template>

<xsl:template match="publisher">
	(<xsl:apply-templates/>).
</xsl:template>

<xsl:template match="edition">
	<xsl:apply-templates/>.<br/>
</xsl:template>

<xsl:template match="biblScope">
	<xsl:apply-templates/>
	<xsl:if test="ancestor::biblStruct">. </xsl:if>
</xsl:template>

<xsl:template match="editor">
   <xsl:apply-templates select="name[position()=1]"/>
   <xsl:for-each select="name[position()>1]">, 
     <xsl:apply-templates/>
   </xsl:for-each> (ed).<br/>
</xsl:template>

<xsl:template match="respStmt">
	<xsl:apply-templates select="resp"/> 
	<xsl:for-each select="name[position()&lt;last()]"><xsl:apply-templates/>, </xsl:for-each>
	<xsl:apply-templates select="child::name[position()=last()]"/>.
	<xsl:if test="ancestor::biblStruct">
		<br/>
	</xsl:if>
</xsl:template>

<xsl:template match="resp">
	<xsl:apply-templates/> 
</xsl:template>

<xsl:template match="witList">
	<xsl:apply-templates select="./witness"/>
</xsl:template>

<xsl:template match="witness">
	<p>
		<a name="{@sigil}"></a>
		<b>Sigle: <xsl:value-of select="@sigil"/></b><br/>
		<xsl:value-of select="text()"/><br/>
		<xsl:apply-templates select="biblStruct"/>
		<xsl:if test="child::note">
			<br/>Zie noot: <xsl:apply-templates select="child::note"/>
		</xsl:if>
	</p>
</xsl:template>

<xsl:template match="listBibl">
<ol>
 <xsl:for-each select="bibl">
  <li><xsl:apply-templates select="."/></li>
 </xsl:for-each>
</ol>
</xsl:template>

<xsl:template match="bibl">
   <xsl:variable name="ident">
    <xsl:apply-templates select="." mode="ident"/>
   </xsl:variable>
   <a name="{$ident}"/>
   <xsl:apply-templates/>
</xsl:template>

<xsl:template match="title" mode="withbr">
  <xsl:value-of select="."/><br/>
</xsl:template>

<xsl:template match="bibl/title">
	<xsl:choose>
		<xsl:when test="@rend='plain'">
			<xsl:value-of select="."/>
		</xsl:when>
 		<xsl:when test="@level='a'">
                   <xsl:text>&#x2018;</xsl:text>
                   <xsl:value-of select="."/><xsl:text>&#x2019; </xsl:text>
 		</xsl:when>
		<xsl:otherwise>
			<i><xsl:value-of select="."/></i>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>


</xsl:stylesheet>

