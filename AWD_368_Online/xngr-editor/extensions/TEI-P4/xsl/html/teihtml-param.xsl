<!-- 
TEI XSLT stylesheet family
$Date: 2004/11/15 14:47:47 $, $Revision: 1.1 $, $Author: edankert $

XSL stylesheet to format TEI XML documents to FO or HTML

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
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
   <xsl:param name="urlChunkPrefix">?ID=</xsl:param>
   <xsl:param name="REQUEST"/>
   <xsl:param name="ID"></xsl:param>
   <xsl:param name="css_override"></xsl:param>
   <xsl:param name="preferred_font">Helvetica</xsl:param>
   <xsl:param name="preferred_size">130%</xsl:param>
   <xsl:param name="preferred_color">#FFFF00</xsl:param>
   <xsl:param name="preferred_bgcolor">#000000</xsl:param>
   <xsl:param name="preferred_linkcolor">#0000FF</xsl:param>
   <xsl:param name="inputName"/>
   <xsl:param name="outputDir"/>
   <xsl:param name="splitLevel">-1</xsl:param>
   <xsl:param name="splitBackmatter">true</xsl:param>
   <xsl:param name="splitFrontmatter">true</xsl:param>
   <xsl:param name="sectionTopLink"/>
   <xsl:param name="useIDs">true</xsl:param>
   <xsl:param name="makingSlides"/>
   <xsl:param name="autoToc">true</xsl:param>
   <xsl:param name="tocDepth">5</xsl:param>
   <xsl:param name="subTocDepth">-1</xsl:param>
   <xsl:param name="tocFront">true</xsl:param>
   <xsl:param name="tocBack">true</xsl:param>
   <xsl:template name="logoPicture"><a target="_top" href="http://www.ox.ac.uk/"><img border="0" width="78" height="94"
    src="/images/ncrest.gif"
    alt="Oxford University"/></a></xsl:template>
   <xsl:param name="cssFile">/stylesheets/tei-oucs.css</xsl:param>
   <xsl:param name="cssSecondaryFile"></xsl:param>
   <xsl:param name="feedbackURL">mailto:feedback</xsl:param>
   <xsl:param name="topNavigationPanel">true</xsl:param>
   <xsl:param name="bottomNavigationPanel">true</xsl:param>
   <xsl:param name="alignNavigationPanel">right</xsl:param>
   <xsl:param name="linkPanel">true</xsl:param>
   <xsl:template name="copyrightStatement">This page is copyrighted</xsl:template>
   <xsl:param name="leftLinks"/>
   <xsl:param name="rightLinks"/>
   <xsl:param name="linksWidth">15%</xsl:param>
   <xsl:param name="makeFrames"/>
   <xsl:param name="makePageTable"/>
   <xsl:param name="frameCols">200,*</xsl:param>
   <xsl:param name="frameAlternateURL"/>
   <xsl:template name="logoFramePicture"><a class="framelogo" target="_top" href="http://www.ox.ac.uk">
   <img src="http://www.oucs.ox.ac.uk/images/newcrest902.gif"
     vspace="5" width="90" height="107" border="0"
  alt="University Of Oxford"/></a></xsl:template>
   <xsl:param name="sectionUpLink"/>
   <xsl:template name="topLink"><p>[<a href="#TOP">Back to top</a>]</p></xsl:template>
   <xsl:param name="divOffset">2</xsl:param>
   <xsl:param name="numberParagraphs"></xsl:param>
   <xsl:param name="generateParagraphIDs">true</xsl:param>
   <xsl:param name="fontURL">span</xsl:param>
   <xsl:param name="tableAlign">left</xsl:param>
   <xsl:param name="cellAlign">left</xsl:param>
   <xsl:param name="showTitleAuthor"/>
   <xsl:param name="footnoteFile"/>
   <xsl:param name="graphicsPrefix"/>
   <xsl:param name="graphicsSuffix">.png</xsl:param>
   <xsl:param name="showFigures">true</xsl:param>
   <xsl:template name="bodyHook"/>
   <xsl:template name="bodyJavaScript"/>
   <xsl:template name="headHook"/>
   <xsl:param name="verbose"/>
   <xsl:param name="downPicture">http://www.oucs.ox.ac.uk/images/down.gif</xsl:param>
   <xsl:param name="useHeaderFrontMatter"/>
   <xsl:param name="outputEncoding">iso-8859-1</xsl:param>

   <xsl:param name="rendSeparator" select="';'"/>

   <xsl:param name="teixslHome">http://www.oucs.ox.ac.uk/stylesheets/</xsl:param> 
   <xsl:param name="noframeWords">No Frames</xsl:param>

   <xsl:template name="singleFileLabel">For Printing</xsl:template>

   <xsl:template name="searchbox"/>
   <xsl:param name="rawIE"/>
<!--
   <xsl:template match="divGen[@type='tsmnews']">
      <hr/>
      <a href="/news/">News</a>
   </xsl:template> -->
<xsl:template name="preAddress"/>
   <xsl:template name="startDivHook"/>
   <xsl:param name="preQuote">&#x2018;</xsl:param>
   <xsl:param name="postQuote">&#x2019;</xsl:param>

   <xsl:param name="class_toc">toc</xsl:param>
   <xsl:param name="class_subtoc">subtoc</xsl:param>
   <xsl:param name="class_quicklink">quicklink</xsl:param>
   <xsl:param name="class_ptr">ptr</xsl:param>
   <xsl:param name="class_ref">ref</xsl:param>
   <xsl:param name="class_xref">xref</xsl:param>
   <xsl:param name="class_xptr">xptr</xsl:param>

   <xsl:template name="xrefHook"/>

</xsl:stylesheet>
