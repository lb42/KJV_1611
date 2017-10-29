<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
     xmlns="http://www.tei-c.org/ns/1.0"    
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
     version="2.0">
 
<!-- applies general fixes for errors identified in version 1.0 of the TEI source 
     LB oct 2017, with tx to David Haslam for identifying bugs --> 
    
 <xsl:output encoding="UTF-8" omit-xml-declaration="yes" 
     method="xml" />
    
    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>
    
   <!-- retag second <head> element for each chapter as an <opener> -->
    <xsl:template match="//div[@type='chapter']/head[2]">
        <xsl:element name="opener">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
  
 <!-- suppress bogus copyright statements  (#14) -->   
    <xsl:template match="//ab[@n='KJV']"><xsl:message>bogus copyright claim suppressed</xsl:message></xsl:template>
  
    <xsl:template match="*|@*|processing-instruction()">
        <xsl:copy>
            <xsl:apply-templates select="*|@*|processing-instruction()|comment()|text()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="text()">
        <xsl:value-of select="."/> <!-- could normalize() here -->
    </xsl:template>
    
    
</xsl:stylesheet>