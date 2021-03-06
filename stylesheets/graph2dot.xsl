<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="text"/>

<xsl:template match="/">
<xsl:apply-templates select="make"/>
</xsl:template>

<xsl:template match="make">
digraph G {
<xsl:apply-templates select="target"/>
}
</xsl:template>
   
   
<xsl:template match="target">
<xsl:variable name="nodeid" select="concat('n',@id)"/>
<xsl:value-of select="$nodeid"/>
<xsl:text>[label="</xsl:text>
<xsl:value-of select="@name"/>
<xsl:text>"];
</xsl:text>
<xsl:for-each select="prerequisites/prerequisite">
<xsl:value-of select="concat('n',@ref)"/>
<xsl:text> -> </xsl:text>
<xsl:value-of select="$nodeid"/>
<xsl:text>;
</xsl:text>
</xsl:for-each>
</xsl:template>   
   
</xsl:stylesheet>
