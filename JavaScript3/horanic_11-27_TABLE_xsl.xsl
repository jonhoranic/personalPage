<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs math"
    xmlns="http://www.w3.org/1999/xhtml" version="3.0">
    
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>

    <!--INITIAL TEMPLATE MATCH-->
    <xsl:template match="/">
        
        <!--TABLE SETUP-->
        <table>
            <tr>
                <th class="tHeader">Question</th>
                <th class="tHeader">Yes</th>
                <th class="tHeader">No</th>
                <th class="tHeader">Blank</th>
                <th class="tHeader">Yes, but fined</th>
            </tr>
            <!--TABLE DATA-->
            <xsl:for-each select="//fs[f[@select = 'Yes']]">
                <xsl:sort select="f[@select = 'Yes']/@n" order="descending"/>
                <!--DOCUMENT XPATH-->
                <xsl:variable name="yes" select="f[@select = 'Yes']/@n"/>
                <xsl:variable name="no" select="f[@select = 'No']/@n"/>
                <xsl:variable name="blank" select="f[@select = 'Blank']/@n"/>
                <xsl:variable name="fine" select="f[@select = 'Yes_but_fined']/@n"/>
                <xsl:variable name="barID" select="./@xml:id"/>
                <tbody id="tbody-{$barID}" style="display: none">
                    <tr>
                        <td class="Q"><xsl:value-of select="f[@name='question']"/></td>
                        <td class="Y"><xsl:value-of select="$yes"/></td>
                        <td class="N"><xsl:value-of select="$no"/></td>
                        <td class="B"><xsl:value-of select="$blank"/></td>
                        <!--CONDITONAL MARKER-->
                        <td class="F">
                            <xsl:if test="f[@select = 'Yes_but_fined']/@n">
                                <xsl:value-of select="$fine"/>
                            </xsl:if>
                        </td>
                    </tr>
                </tbody>
            </xsl:for-each>
        </table>
   
    </xsl:template>
    
</xsl:stylesheet>