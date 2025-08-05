<xsl:stylesheet version="3.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:sch ="http://purl.oclc.org/dsdl/schematron"
                xmlns:nvr="NLCSValidatieRegelsNameSpace"
                exclude-result-prefixes="sch nvr">
  
  <xsl:output method="xml" indent="yes"/>
  <xsl:strip-space elements="*"/>

  <!-- Load documents -->
  <xsl:variable name="schema" select="document('../validation_schemas/v11.sch')"/>
  <xsl:variable name="config-doc" select="document('../doc/NLCSValidatieRegels.xml')"/>
  <xsl:variable name="scopes" select="$config-doc/nvr:NLCSValidatieregels/nvr:scopes/nvr:scope"/>
  
  <xsl:template match="/">
    <xsl:for-each select="$scopes">
      <xsl:variable name="scope" select="."/>
      <xsl:variable name="rules" select="$scope/nvr:scopeValidatieRegels/nvr:scopeValidatieRegel"/>
      <xsl:variable name="filename" select="lower-case(translate(@naam, ' ', '_'))"/>
      <xsl:variable name="file" select="concat('validation_schemas/', $filename, '.sch')"/>      
      <xsl:result-document href="{$file}">
        <xsl:apply-templates select="$schema/*">
          <xsl:with-param name="rules" select="$rules"/>
          <xsl:with-param name="scope-name" select="@naam"/>
        </xsl:apply-templates>
      </xsl:result-document>
    </xsl:for-each>
  </xsl:template>
  
  <!-- Identity template: copies all nodes -->
  <xsl:template match="@* | node()">
    <xsl:param name="rules"/>
    <xsl:param name="scope-name"/>
    <xsl:copy>
      <xsl:apply-templates select="@* | node()">
        <xsl:with-param name="rules" select="$rules"/>       
        <xsl:with-param name="scope-name" select="$scope-name"/>
      </xsl:apply-templates>
    </xsl:copy>
  </xsl:template>
  
  <!-- Only copy required <phase> elements -->
  <xsl:template match="sch:phase">
    <xsl:param name="rules"/>
    <xsl:if test="@id = $rules/nvr:nummer">
      <xsl:copy>
        <xsl:apply-templates select="@* | node()"/>
      </xsl:copy>
    </xsl:if>
  </xsl:template>
  
  <!-- Replace the scope property value -->
  <xsl:template match="sch:property[@id='scope']">
    <xsl:param name="scope-name"/>
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:value-of select="$scope-name"/>
    </xsl:copy>
  </xsl:template>
 
</xsl:stylesheet>
