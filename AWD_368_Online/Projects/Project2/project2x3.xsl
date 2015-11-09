<?xml version='1.0' encoding='UTF-8'?>

<!--
  Student Name: Aaron Anderson
  Project 2.3
  Date: 07/15/2015
-->

<xsl:stylesheet xmlns:xsl='http://www.w3.org/1999/XSL/Transform' version='1.0'>

<xsl:output method='text' />
<xsl:decimal-format name="dateMonthDay" NaN="00" />
<xsl:decimal-format name="dateYear" NaN="0000" />

<xsl:template match='exchanges'>

<xsl:for-each select='exchange'>
<xsl:value-of select='format-number(substring(@exchangeID, 2), "00000000")' />
<xsl:call-template name='formatString'>
    <xsl:with-param name='suppliedString' select='name/nameLast' />
    <xsl:with-param name='suppliedLength' select='20' />
</xsl:call-template>
<xsl:call-template name='formatString'>
    <xsl:with-param name='suppliedString' select='name/nameFirst' />
    <xsl:with-param name='suppliedLength' select='15' />
</xsl:call-template>
<xsl:call-template name='formatString'>
    <xsl:with-param name='suppliedString' select='name/nameMiddleInitial' />
    <xsl:with-param name='suppliedLength' select='1' />
</xsl:call-template>
<xsl:apply-templates select='addressHome' />
<xsl:call-template name='formatString'>
    <xsl:with-param name='suppliedString' select='translate(telephone, "()- ", "")' />
    <xsl:with-param name='suppliedLength' select='10' />
</xsl:call-template>
<xsl:call-template name='formatString'>
    <xsl:with-param name='suppliedString' select='email' />
    <xsl:with-param name='suppliedLength' select='30' />
</xsl:call-template>
<xsl:call-template name='formatDate'>
    <xsl:with-param name='dateMonth' select='applicationDate/applicationDateMonth' />
    <xsl:with-param name='dateDay' select='applicationDate/applicationDateDay' />
    <xsl:with-param name='dateYear' select='concat("20", applicationDate/applicationDateYear)' />
</xsl:call-template>
<xsl:call-template name='formatDate'>
    <xsl:with-param name='dateMonth' select='availableDate/availableDateMonth' />
    <xsl:with-param name='dateDay' select='availableDate/availableDateDay' />
    <xsl:with-param name='dateYear' select='concat("20", availableDateYear)' />
</xsl:call-template>
<xsl:call-template name='formatDate'>
    <xsl:with-param name='dateMonth' select='dateOfBirth/birthDateMonth' />
    <xsl:with-param name='dateDay' select='dateOfBirth/birthDateDay' />
    <xsl:with-param name='dateYear' select='dateOfBirth/birthDateYear' />
</xsl:call-template>
<xsl:call-template name='formatString'>
    <xsl:with-param name='suppliedString' select='birthCountry' />
    <xsl:with-param name='suppliedLength' select='30' />
</xsl:call-template>
<xsl:value-of select='format-number(age, "00", "dateMonthDay")' />
<xsl:value-of select='translate(substring(gender, 1, 1), "mf", "MF")' />
<xsl:call-template name='formatString'>
    <xsl:with-param name='suppliedString' select='schoolName' />
    <xsl:with-param name='suppliedLength' select='35' />
</xsl:call-template>
<xsl:call-template name='formatString'>
    <xsl:with-param name='suppliedString' select='yearInSchool' />
    <xsl:with-param name='suppliedLength' select='9' />
</xsl:call-template>
<xsl:call-template name='formatString'>
    <xsl:with-param name='suppliedString' select='translate(emergencyTelephone, "()- ", "")' />
    <xsl:with-param name='suppliedLength' select='10' />
</xsl:call-template>
<xsl:value-of select='format-number(feePaid, "00000000")' />
<xsl:value-of select='feePaid/@currency' />
<xsl:call-template name='formatString'>
    <xsl:with-param name='suppliedString' select='concat(motherName/nameFirstMother, " ", motherName/nameMiddleInitialMother, " ", motherName/nameLastMother)' />
    <xsl:with-param name='suppliedLength' select='30' />
</xsl:call-template>
<xsl:call-template name='formatString'>
    <xsl:with-param name='suppliedString' select='concat(fatherName/nameFirstFather, " ", fatherName/nameMiddleInitialFather, " ", fatherName/nameLastFather)' />
    <xsl:with-param name='suppliedLength' select='30' />
</xsl:call-template>
<xsl:text>
</xsl:text>
</xsl:for-each>

</xsl:template>

<xsl:template name='formatString'>
    <xsl:param name='suppliedString' />
    <xsl:param name='suppliedLength' />
    <xsl:value-of select='substring(concat(normalize-space($suppliedString), "                                                  "), 1, $suppliedLength)' />
</xsl:template>

<xsl:template name='formatDate'>
    <xsl:param name='dateMonth'/>
    <xsl:param name='dateDay'/>
    <xsl:param name='dateYear'/>
    <xsl:value-of select='format-number($dateMonth, "00", "dateMonthDay")' />
    <xsl:value-of select='format-number($dateDay, "00", "dateMonthDay")' />
    <xsl:value-of select='format-number($dateYear, "0000", "dateYear")' />
</xsl:template>

<xsl:template match='addressHome'>
    <xsl:call-template name='formatString'>
        <xsl:with-param name='suppliedString' select='addressStreet' />
        <xsl:with-param name='suppliedLength' select='25' />
    </xsl:call-template>
    <xsl:call-template name='formatString'>
        <xsl:with-param name='suppliedString' select='addressApartment' />
        <xsl:with-param name='suppliedLength' select='12' />
    </xsl:call-template>
    <xsl:call-template name='formatString'>
        <xsl:with-param name='suppliedString' select='addressCity' />
        <xsl:with-param name='suppliedLength' select='35' />
    </xsl:call-template>
    <xsl:call-template name='formatString'>
        <xsl:with-param name='suppliedString' select='addressState' />
        <xsl:with-param name='suppliedLength' select='15' />
    </xsl:call-template>
    <xsl:call-template name='formatString'>
        <xsl:with-param name='suppliedString' select='addressZip' />
        <xsl:with-param name='suppliedLength' select='10' />
    </xsl:call-template>
    <xsl:call-template name='formatString'>
        <xsl:with-param name='suppliedString' select='addressCountry' />
        <xsl:with-param name='suppliedLength' select='30' />
    </xsl:call-template>
</xsl:template>

</xsl:stylesheet>