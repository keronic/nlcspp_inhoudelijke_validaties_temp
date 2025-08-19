<xsl:stylesheet version="3.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:sch="http://purl.oclc.org/dsdl/schematron"
                exclude-result-prefixes="#all">

  <xsl:mode on-no-match="shallow-copy"/>

  <!-- Match sch:include -->
  <xsl:template match="sch:include">
    <!-- Get the href and load the document -->
    <xsl:variable name="doc" select="doc(resolve-uri(@href, base-uri(.)))"/>
    <!-- Copy *contents* of included document, not the outer schematron element -->
    <xsl:apply-templates select="$doc/node()"/>
  </xsl:template>

</xsl:stylesheet>
