<xsl:stylesheet version="3.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:sch ="http://purl.oclc.org/dsdl/schematron"
                xmlns:nvr="NLCSValidatieRegelsNameSpace"
                exclude-result-prefixes="sch nvr">
  
  <xsl:output method="xml" indent="yes"/>
  <xsl:strip-space elements="*"/>

  <!-- Load documents -->
  <xsl:variable name="config-doc" select="document('../doc/NLCSValidatieRegels.xml')"/>
  <xsl:variable name="scopes" select="$config-doc/nvr:NLCSValidatieregels/nvr:scopes/nvr:scope"/>
  
  <!-- Create copies of the schema with only the required phases based on the scopes within the config-doc -->
  <xsl:template match="/">
    <xsl:variable name="schema" select="."/>
    <xsl:for-each select="$scopes">
      <xsl:variable name="scope" select="."/>
      <xsl:variable name="rules" select="$scope/nvr:scopeValidatieRegels/nvr:scopeValidatieRegel"/>
      <xsl:variable name="filename" select="lower-case(translate(@naam, ' ', '_'))"/>
      <xsl:variable name="file" select="concat('validation_schemas/scopes/', $filename, '.sch')"/>      
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
  
  <!-- Only copy <phase> elements if their rule number is in the scope's rules -->
  <xsl:template match="sch:phase">
    <xsl:param name="rules"/>
    <xsl:if test="@id = $rules/nvr:nummer">
      <xsl:copy>
        <xsl:apply-templates select="@* | node()"/>
      </xsl:copy>
    </xsl:if>
  </xsl:template>
  
  <!-- Only copy <pattern> elements if their rule number is in the scope's rules -->
  <xsl:template match="sch:pattern">
    <xsl:param name="rules"/>
    <xsl:variable name="rule-numbers" select="sch:rule/sch:let[@name='rule_number']/@value"/>
    <xsl:if test="some $rule-number in $rule-numbers satisfies concat('R.', $rule-number) = $rules/nvr:nummer">
      <xsl:copy>
        <xsl:apply-templates select="@* | node()">
          <xsl:with-param name="rules" select="$rules"/>          
        </xsl:apply-templates>
      </xsl:copy>
    </xsl:if>
  </xsl:template>
  
  <!-- Replace the value of the scope property -->
  <xsl:template match="sch:property[@id='scope']">
    <xsl:param name="scope-name"/>
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:value-of select="$scope-name"/>
    </xsl:copy>
  </xsl:template>
  
  <!-- Set severity of assert based on scope rule's niveau -->
  <xsl:template match="sch:assert">
    <xsl:param name="rules"/>
    <xsl:variable name="rule-number" select="ancestor::sch:rule/sch:let[@name='rule_number']/@value"/>
    <xsl:variable name="rule" select="concat('R.', $rule-number)"/>
    <xsl:variable name="severity" select="$rules[nvr:nummer = $rule]/nvr:niveau"/>
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:attribute name="severity" select="$severity"/>
      <xsl:apply-templates select="node()">
        <xsl:with-param name="rules" select="$rules"/>
      </xsl:apply-templates>
    </xsl:copy>
  </xsl:template>
 
</xsl:stylesheet>
