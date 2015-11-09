<?xml version='1.0' ?>

<!--
  Student Name: Aaron Anderson
  Project 2.1
  Date: 07/15/2015
  File References: project2x1
-->

<xsl:stylesheet version='1.0' xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>

<xsl:template match='/'>
    <html>
        <head>
            <title>Project 2.1</title>
            <link href='project2x1.css' rel='stylesheet' type='text/css' />
        </head>
        <body>
            <h1>Exchange Information</h1>
            <xsl:apply-templates select='exchanges/exchange[@classification="S"]'>
                <xsl:sort select='name/nameLast' order='ascending' />
                <xsl:sort select='name/nameFirst' order='ascending' />
                <xsl:sort select='name/nameMiddleInitial' order='ascending' />
            </xsl:apply-templates>
        </body>
    </html>
</xsl:template>

<xsl:template match='exchanges/exchange'>
    <table>
        <tr class='header'>
            <td class='boldText'>Exchange Type:</td>
            <td><xsl:value-of select='@classification' /></td>
            <td class='boldText'>Reference Number:</td>
            <td><xsl:value-of select='@exchangeID' /></td>
        </tr>
        <tr class='subhead'>
            <td>Name (First, Middle, Last):</td>
            <td><xsl:value-of select='name/nameFirst' /></td>
            <td><xsl:value-of select='name/nameMiddleInitial' /></td>
            <td><xsl:value-of select='name/nameLast' /></td>
        </tr>
        <xsl:apply-templates select="addressHome" />
        <tr>
            <td class='addressCaption navyText'>Telephone:</td>
            <td><xsl:value-of select='telephone' /></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td class='addressCaption navyText'>Email Address:</td>
            <td><xsl:value-of select='email' /></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td colspan='4'><hr /></td>
        </tr>
        <tr>
            <td class='navyText'>Application Date <span class="italics">(mm dd yyyy)</span></td>
            <td><xsl:apply-templates select="applicationDate" /></td>
            <td class='navyText'>Available Date <span class="italics">(mm dd yyyy)</span></td>
            <td><xsl:apply-templates select="availableDate" /></td>
        </tr>
        <tr>
            <td class='navyText'>Birth Country:</td>
            <td><xsl:value-of select='birthCountry' /></td>
            <td class='navyText'>Birth Date <span class="italics">(mm dd yyyy)</span></td>
            <td><xsl:apply-templates select="dateOfBirth" /></td>
        </tr>
        <tr>
            <td class='navyText'>Age:</td>
            <td><xsl:value-of select='age' /></td>
            <td class='navyText'>Gender:</td>
            <td><xsl:value-of select='gender' /></td>
        </tr>
        <tr>
            <td colspan='4'><hr /></td>
        </tr>
        <tr>
            <td class='navyText'>School Name:</td>
            <td><xsl:value-of select='schoolName' /></td>
            <td></td>
            <td></td>
        </tr>
        <xsl:apply-templates select="schoolAddress" />
        <tr>
            <td class='navyText'>Year in School:</td>
            <td><xsl:value-of select='yearInSchool' /></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td colspan='4'><hr /></td>
        </tr>
        <tr>
            <td class='navyText'>Mother's Name (Last, First, Middle):</td>
            <td><xsl:value-of select='motherName/nameLastMother' /></td>
            <td><xsl:value-of select='motherName/nameFirstMother' /></td>
            <td><xsl:value-of select='motherName/nameMiddleInitialMother' /></td>
        </tr>
        <tr>
            <td class='navyText'>Father's Name (Last, First, Middle):</td>
            <td><xsl:value-of select='fatherName/nameLastFather' /></td>
            <td><xsl:value-of select='fatherName/nameFirstFather' /></td>
            <td><xsl:value-of select='fatherName/nameMiddleInitialFather' /></td>
        </tr>
        <tr>
            <td class='navyText'>Emergency Telephone:</td>
            <td><xsl:value-of select='emergencyTelephone' /></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td class='navyText'>Fee Paid:</td>
            <td><xsl:value-of select='feePaid' /></td>
            <td class='navyText'>Currency:</td>
            <td><xsl:value-of select='feePaid/@currency' /></td>
        </tr>
        <tr>
            <td class='navyText'>Essay:</td>
            <td colspan='3'><xsl:value-of select='essay' /></td>
        </tr>
        <tr>
            <td colspan='4'><hr /></td>
        </tr>
        <xsl:for-each select='languageSpoken'>
            <xsl:sort select='@fluency' order='descending' data-type='number' />
            <tr>
                <td class='navyText'>Fluency (1=None, 4=Fluent):</td>
                <td><xsl:value-of select='@fluency' /></td>
                <td class='navyText'>Language:</td>
                <td><xsl:value-of select='../languageSpoken' /></td>
            </tr>
        </xsl:for-each>
        <tr>
            <td colspan='4'><hr /></td>
        </tr>
        <xsl:for-each select='countryChoice'>
            <xsl:sort select='@preference' order='ascending' data-type='number' />
            <tr>
                <td class='navyText'>Priority (1=High, 5=Low):</td>
                <td><xsl:value-of select='@preference' /></td>
                <td class='navyText'>Country Choice:</td>
                <td><xsl:value-of select='../countryChoice' /></td>
            </tr>
        </xsl:for-each>
    </table>
    <br />
</xsl:template>

<xsl:template match="addressHome">
    <tr>
        <td class='addressCaption navyText'>Street, Apartment:</td>
        <td><xsl:value-of select='addressStreet' /></td>
        <td></td>
        <td><xsl:value-of select='addressApartment' /></td>
    </tr>
    <tr>
        <td class='addressCaption navyText'>City, State, Zip:</td>
        <td><xsl:value-of select='addressCity' /></td>
        <td><xsl:value-of select='addressState' /></td>
        <td><xsl:value-of select='addressZip' /></td>
    </tr>
    <tr>
        <td class='addressCaption navyText'>Country:</td>
        <td><xsl:value-of select='addressCountry' /></td>
        <td></td>
        <td></td>
    </tr>
</xsl:template>

<xsl:template match="applicationDate">
    <xsl:value-of select='concat(applicationDateMonth, " ", applicationDateDay, " 20", applicationDateYear)' />
</xsl:template>

<xsl:template match="availableDate">
    <xsl:value-of select='concat(availableDateMonth, " ", availableDateDay, " 20", availableDateYear)' />
</xsl:template>

<xsl:template match="dateOfBirth">
    <xsl:value-of select='concat(birthDateMonth, " ", birthDateDay, " ", birthDateYear)' />
</xsl:template>

<xsl:template match="schoolAddress">
    <tr>
        <td class='italic navyText'>Street, Apartment:</td>
        <td><xsl:value-of select='addressStreetSchool' /></td>
        <td></td>
        <td><xsl:value-of select='addressApartmentSchool' /></td>
    </tr>
    <tr>
        <td class='italic navyText'>City, State, Zip:</td>
        <td><xsl:value-of select='addressCitySchool' /></td>
        <td><xsl:value-of select='addressStateSchool' /></td>
        <td><xsl:value-of select='addressZipSchool' /></td>
    </tr>
    <tr>
        <td class='italic navyText'>Country:</td>
        <td><xsl:value-of select='addressCountrySchool' /></td>
        <td></td>
        <td></td>
    </tr>
</xsl:template>

</xsl:stylesheet>
