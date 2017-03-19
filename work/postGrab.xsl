<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:h="http://www.w3.org/1999/xhtml"
    xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs h" 
    version="2.0">
    <xsl:param name="chapId">XXXXXX</xsl:param>
  
  <xsl:output encoding="UTF-8" omit-xml-declaration="yes" method="xml" />
  
    <xsl:template match="/">
        <div xml:id="{concat('C',$chapId)}" type="chapter" xmlns="http://www.tei-c.org/ns/1.0">
        <xsl:apply-templates/>
        </div>
    </xsl:template>
   
    <xsl:template match="h:p[h:a]">
      <xsl:choose> <xsl:when test="not(h:a[@name])"> <ab>
            <xsl:attribute name="n">
                <xsl:value-of select="h:sup"/>
            </xsl:attribute>
            <xsl:apply-templates select="h:a"/>
       </ab></xsl:when>
          <xsl:when test="h:a/h:strong">
          <fw><xsl:value-of select="h:a/h:strong"/></fw>
      </xsl:when></xsl:choose>
    </xsl:template>
    
   
    
    <xsl:template match="h:a/h:sup">
        <note>
            <xsl:value-of select="substring-after(../@title,'Reference:')"/>
        </note>
    </xsl:template>
    <xsl:template match="h:img">
        <pb facs="{@src}"/>
    </xsl:template>
    <xsl:template match="h:p/h:span">
        <head><xsl:apply-templates/></head>
    </xsl:template>
</xsl:stylesheet>