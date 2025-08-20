<xsl:stylesheet version="3.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:nlcs="NLCSnetbeheer"
                xmlns:nvr="NLCSValidatieRegelsNameSpace"
                exclude-result-prefixes="#all">

  <xsl:output method="text"/>
  <xsl:strip-space elements="*"/>

  <xsl:variable name="config-doc" select="document('../doc/NLCSValidatieRegels.xml')"/>
  <xsl:variable name="scopes" select="$config-doc/nvr:NLCSValidatieregels/nvr:scopes/nvr:scope"/>

  <xsl:template match="/nlcs:NLCSnetbeheerType">
    <xsl:variable name="nlcs-objects"
      select="*[not(self::nlcs:VersieNummer or self::nlcs:AprojectReferentie)]"/>
    <xsl:variable name="status-list"
      select="$nlcs-objects/nlcs:Status"/>
    <xsl:variable name="bedrijfstoestand-list"
      select="$nlcs-objects/nlcs:Bedrijfstoestand"/>
    <xsl:variable name="tekeningType" select="nlcs:AprojectReferentie/nlcs:TekeningType"/>
      <xsl:for-each select="$scopes[
          upper-case(nvr:tekeningSoort) = $tekeningType
          and (every $status in $status-list satisfies $status = nvr:statussen/nvr:status)
          and (every $bedrijfstoestand in $bedrijfstoestand-list satisfies $bedrijfstoestand = nvr:bedrijfsToestanden/nvr:bedrijfstoestand)]">
          <xsl:value-of select="translate(lower-case(@naam), ' ', '_')"/>
          <!-- Add newline -->
          <xsl:text>&#10;</xsl:text>
      </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
