<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:sch="http://purl.oclc.org/dsdl/schematron"
                exclude-result-prefixes="sch">

  <!-- Identity: copy everything as-is -->
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="sch:rule/@context">
    <xsl:attribute name="context">
      <xsl:for-each select="tokenize(., '\|')">
        <!-- Append every context attribute with the scope check -->
        <xsl:value-of select="concat(normalize-space(.), '[keronic:rule-within-scope-for-object($rule_number, .)]')" />
        <!-- Rejoin with ' | ' if not last -->
        <xsl:if test="position() != last()"> | </xsl:if>
      </xsl:for-each>
    </xsl:attribute>
  </xsl:template>

</xsl:stylesheet>
