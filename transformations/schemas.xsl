<xsl:stylesheet version="3.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:sch ="http://purl.oclc.org/dsdl/schematron"
                xmlns:nvr="NLCSValidatieRegelsNameSpace"
                exclude-result-prefixes="sch nvr">
  
  <xsl:output method="xml" indent="yes"/>
  
  <!-- Load documents -->
  <xsl:variable name="schema" select="document('../validation_schemas/v11.sch')"/>
  <xsl:variable name="config-doc" select="document('../doc/NLCSValidatieRegels.xml')"/>
  <xsl:variable name="scopes" select="$config-doc/nvr:NLCSValidatieregels/nvr:scopes/nvr:scope"/>
  
  <xsl:template match="/">
    <xsl:for-each select="$scopes">
      <xsl:variable name="scope" select="."/>
      <xsl:variable name="rules" select="$scope/nvr:scopeValidatieRegels/nvr:scopeValidatieRegel/nvr:nummer"/>
      <xsl:variable name="filename" select="lower-case(translate(@naam, ' ', '_'))"/>
      <xsl:variable name="file" select="concat('validation_schemas/', $filename, '.sch')"/>

      <xsl:result-document href="{$file}">
        <xsl:apply-templates select="$schema/*">
          <xsl:with-param name="rules" select="$rules"/>
        </xsl:apply-templates>
      </xsl:result-document>
    </xsl:for-each>
  </xsl:template>
  
  <!-- Identity template: copies all nodes -->
  <xsl:template match="@* | node()">
    <xsl:param name="rules"/>
    <xsl:copy>
      <xsl:apply-templates select="@* | node()">
        <xsl:with-param name="rules" select="$rules"/>        
      </xsl:apply-templates>
    </xsl:copy>
  </xsl:template>
  
  <!-- Only copy required <phase> elements -->
  <xsl:template match="sch:phase">
    <xsl:param name="rules"/>
    <xsl:if test="some $rule in $rules satisfies @id = $rule">
      <xsl:copy>
        <xsl:apply-templates select="@* | node()"/>
      </xsl:copy>
    </xsl:if>
  </xsl:template>
  
</xsl:stylesheet>
