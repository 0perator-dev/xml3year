<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output indent="yes" method="xml"/>

<xsl:template match="/">


<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">


<fo:layout-master-set>


<fo:simple-page-master margin-right="2.5cm" margin-left="2.5cm" margin-bottom="2cm" margin-top="1cm" page-width="21cm" page-height="29.7cm" master-name="page">

<fo:region-body margin-top="3cm"/>

<fo:region-before extent="3cm"/>

<fo:region-after extent="1.5cm"/>

</fo:simple-page-master>

</fo:layout-master-set>


<fo:page-sequence master-reference="page">


<fo:flow flow-name="xsl-region-body">


<fo:block font-weight="bold" text-align="center" font-family="Arial" padding-before = "12mm" padding-after="6mm" font-size="25pt">

Каталог на туристическа агенция

</fo:block>


<fo:block font-family="Arial">

<xsl:apply-templates select="catalogue"/>

</fo:block>

</fo:flow>

</fo:page-sequence>

</fo:root>

</xsl:template>


<xsl:template match="catalogue">


<xsl:for-each select="./regions/region">

<xsl:variable select="@id" name="region_id"/>


<fo:block font-size="20pt" text-align="center">

<xsl:value-of select="."/>

</fo:block>


<xsl:for-each select="../../vacations/vacation[@region_id=$region_id]">


<fo:block font-size="16pt" padding-after="3mm">

<xsl:value-of select="./@destination"/>

</fo:block>

<fo:external-graphic scaling="non-uniform" margin-left="5cm" content-width="6.00in" height="4.00in" content-height="scale-to-fit" src="{unparsed-entity-uri(@photo)}"/>


<fo:block font-weight="bold" text-align="center" font-family="Arial" padding-before = "3mm" padding-after="3mm" >

Обща информация за пътуването 

</fo:block>


<fo:block>
Продължителност: 
<xsl:value-of select="./stay"/>
дни
</fo:block>


<fo:block>
Вид транспорт: 
<xsl:value-of select="./transport"/>

</fo:block>


<fo:block>
Цена: 
<xsl:value-of select="./price"/>
лв
</fo:block>


<fo:block font-weight="bold" text-align="center" font-family="Arial" padding-before = "3mm" padding-after="3mm" >

График за екскурзията:

</fo:block>


<xsl:for-each select="./schedule/day">


<fo:block>
<xsl:value-of select="."/>

</fo:block>

</xsl:for-each>


<fo:block font-weight="bold" text-align="center" font-family="Arial" padding-before = "3mm" padding-after="3mm" >

Цената включва следните услуги:

</fo:block>


<xsl:for-each select="./includes/service">


<fo:list-block>


<fo:list-item>


<fo:list-item-label end-indent="label-end()">


<fo:block>

<fo:inline font-family="Symbol">·</fo:inline>

</fo:block>

</fo:list-item-label>


<fo:list-item-body start-indent="body-start()">


<fo:block>


<fo:block>

<xsl:value-of select="."/>

</fo:block>

</fo:block>

</fo:list-item-body>

</fo:list-item>

</fo:list-block>

</xsl:for-each>


<fo:block font-weight="bold" text-align="center" font-family="Arial" padding-before = "3mm" padding-after="3mm" >

Налични дати за пътуването

</fo:block>


<fo:list-block>


<xsl:for-each select="./dates/date">


<fo:list-item>


<fo:list-item-label end-indent="label-end()">


<fo:block>

<fo:inline font-family="Symbol">·</fo:inline>

</fo:block>

</fo:list-item-label>


<fo:list-item-body start-indent="body-start()">


<fo:block>


<fo:block>

<xsl:value-of select="./@value"/>

</fo:block>


<fo:block font-weight="bold" text-align="center" font-family="Arial" padding-before = "3mm" padding-after="3mm" >

Списък със записаните до момента пътници:

</fo:block>


<xsl:variable select="./@person_id" name="person_ids"/>


<xsl:for-each select="/catalogue/people/person">


<xsl:choose>


<xsl:when test="contains($person_ids, @id)">


<fo:block>

<xsl:value-of select="./name"/>
, Телефон за връзка: 
<xsl:value-of select="./phoneNumber"/>
, ЕГН: 
<xsl:value-of select="./EGN"/>

</fo:block>

</xsl:when>

</xsl:choose>

</xsl:for-each>

</fo:block>

</fo:list-item-body>

</fo:list-item>

</xsl:for-each>

</fo:list-block>

</xsl:for-each>

</xsl:for-each>

</xsl:template>

</xsl:stylesheet>