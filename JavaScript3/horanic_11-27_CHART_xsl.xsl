<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs math"
    xmlns="http://www.w3.org/1999/xhtml" version="3.0">

    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>

    <!--SPACIAL VARIABLES-->
    <xsl:variable name="numQ" select="count(//f[@select = 'Yes'])"/>

    <xsl:variable name="xSpacer" select="50"/>
    <xsl:variable name="maxValueX" select="$numQ * $xSpacer"/>

    <xsl:variable name="ySpacer" select="5"/>
    <xsl:variable name="maxValueY" select="100 * $ySpacer"/>

    <!--INITIAL TEMPLATE MATCH-->
    <xsl:template match="/">
        
            <!--SPACIAL COMMENTS-->
            <xsl:comment>The total number of questions is: <xsl:value-of select="$numQ"/>.</xsl:comment>
            <xsl:comment>The total length of the X axis is set to <xsl:value-of select="$maxValueX"/>.</xsl:comment>
            <xsl:comment>The maximum Y value is <xsl:value-of select="$maxValueY"/></xsl:comment>
            <!--SVG OUTPUT VIEW WINDOW-->
            <svg width="800" height="800">
                <g transform="translate(50 600)">

                    <!--X AXIS-->
                    <line x1="20" y1="0" x2="{$maxValueX + $xSpacer}" y2="0" stroke="black"
                        stroke-width="1"/>

                    <!--Y AXIS-->
                    <line x1="20" y1="0" x2="20" y2="{-$maxValueY}" stroke="black" stroke-width="1"/>

                    <!--BAR VARIABLES-->
                    <xsl:for-each select="//fs[f[@select = 'Yes']]">
                        <xsl:sort select="f[@select = 'Yes']/@n" order="descending"/>
                        <!--DOCUMENT XPATH-->
                        <xsl:variable name="yes" select="f[@select = 'Yes']/@n"/>
                        <xsl:variable name="no" select="f[@select = 'No']/@n"/>
                        <xsl:variable name="blank" select="f[@select = 'Blank']/@n"/>
                        <xsl:variable name="fine" select="f[@select = 'Yes_but_fined']/@n"/>
                        <!--SUM MULTIPLIER-->
                        <xsl:variable name="sum" select="sum(f/@n)"/>
                        <!--CALCULATIONS-->
                        <xsl:variable name="yesPer" select="($yes div $sum * 100)"/>
                        <xsl:variable name="noPer" select="($no div $sum * 100)"/>
                        <xsl:variable name="blankPer" select="($blank div $sum * 100)"/>
                        <xsl:variable name="finePer" select="($fine div $sum * 100)"/>
                        <!--SPACING-->
                        <xsl:variable name="xPos" select="position() * $xSpacer"/>
                        <!--BAR NAMES-->
                        <xsl:variable name="barName" select="./@xml:id"/>
                        <!--STACKING-->
                        <g class="bar" id="{$barName}">
                            <line class="Yes" x1="{$xPos}" y1="0" x2="{$xPos}"
                                y2="-{$yesPer * $ySpacer}" stroke="#1645B0" stroke-width="30"/>
                            <line class="No" x1="{$xPos}" y1="-{$yesPer * $ySpacer}" x2="{$xPos}"
                                y2="-{($noPer + $yesPer) * $ySpacer}" stroke="#FD060C"
                                stroke-width="30"/>
                            <line class="Blank" x1="{$xPos}" y1="-{($noPer + $yesPer) * $ySpacer}"
                                x2="{$xPos}" y2="-{($blankPer + $noPer + $yesPer) * $ySpacer}"
                                stroke="#0FD205" stroke-width="30"/>
                            <!--CONDITONAL-->
                            <xsl:if test="f[@select = 'Yes_but_fined']/@n">
                                <line class="Yes_but_fined" x1="{$xPos}"
                                    y1="-{($blankPer + $noPer + $yesPer) * $ySpacer}" x2="{$xPos}"
                                    y2="-{($finePer + $blankPer + $noPer + $yesPer) * $ySpacer}"
                                    stroke="#FFAC06" stroke-width="30"/>
                            </xsl:if>
                            <!--PERCENTAGE MARKERS-->
                            <text x="{$xPos}" y="-{($yesPer div 2) * $ySpacer}" text-anchor="middle"
                                stroke="white">
                                <xsl:value-of select='format-number($yesPer div 100, "##%")'/>
                            </text>
                            <text x="{$xPos}" y="-{(($noPer div 2) + $yesPer) * $ySpacer}"
                                text-anchor="middle" stroke="white">
                                <xsl:value-of select='format-number($noPer div 100, "##%")'/>
                            </text>
                            <text x="{$xPos}"
                                y="-{(($blankPer div 2) + $noPer + $yesPer) * $ySpacer}"
                                text-anchor="middle" stroke="white">
                                <xsl:value-of select='format-number($blankPer div 100, "##%")'/>
                            </text>
                            <!--CONDITONAL MARKER-->
                            <xsl:if test="f[@select = 'Yes_but_fined']/@n">
                                <text x="{$xPos}"
                                    y="-{(($finePer + $blankPer + $noPer + $yesPer) * $ySpacer) + 4}"
                                    text-anchor="middle" stroke="black">
                                    <xsl:value-of select='format-number($finePer div 100, "##%")'/>
                                </text>
                            </xsl:if>
                        </g>
                    </xsl:for-each>

                    <!--HASHLINES-->
                    <xsl:for-each select="5, 10">
                        <xsl:variable name="yAxis_HashLocator" select=". * 50"/>
                        <xsl:variable name="yAxis_HashName" select=". * 10"/>
                        <text x="5" y="{-$yAxis_HashLocator}" text-anchor="middle"
                            font-weight="bold">
                            <xsl:value-of select="$yAxis_HashName"/>% </text>
                        <line x1="20" x2="{$maxValueX + $xSpacer}" y1="{-$yAxis_HashLocator}"
                            y2="{-$yAxis_HashLocator}" stroke="purple" stroke-width=".8"
                            stroke-dasharray="10"/>
                    </xsl:for-each>
                </g>
            </svg>
        
    </xsl:template>
</xsl:stylesheet>
