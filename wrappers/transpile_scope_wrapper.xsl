<xsl:stylesheet version="3.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:schxslt="http://dmaus.name/ns/2023/schxslt"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:svrl="http://purl.oclc.org/dsdl/svrl">

  <xsl:import href="../transpile.xsl"/>

  <!-- Use phase as an alternative for schxslt:phase since namespaced parameters cannot be passed through Saxon CLI -->
  <xsl:param name="phase" as="xs:string" select="'#DEFAULT'"/>
  <xsl:param name="schxslt:phase" as="xs:string" select="$phase"/>

  <!-- Override root template to control output filename (.xsl instead of .sch.xml) -->
  <xsl:template match="/">
    <xsl:variable name="filename" as="xs:string"
      select="replace(tokenize(base-uri(), '/')[last()], '\.sch$', '')"/>
    <xsl:result-document href="{concat($filename, '.xsl')}">
      <xsl:next-match/>
    </xsl:result-document>
  </xsl:template>
</xsl:stylesheet>
