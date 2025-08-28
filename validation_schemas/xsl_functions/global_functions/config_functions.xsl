<stylesheet xmlns="http://www.w3.org/1999/XSL/Transform"
            xmlns:math="http://www.w3.org/2005/xpath-functions/math"
            xmlns:keronic="http://example.com/my-functions"
            xmlns:xs="http://www.w3.org/2001/XMLSchema"
            xmlns:map="http://www.w3.org/2005/xpath-functions/map"
            xmlns:nlcs="NLCSnetbeheer"
            xmlns:nvr="NLCSValidatieRegelsNameSpace"
            version="3.0">

  <variable name="config_file" select= "document('../../../configuration/config.xml')"/>
  <variable name="language" select= "$config_file/config/V11/Language"/>
  <variable name="translation_file" select= "document('../../../localization/messages.xml')"/>
  <variable name="validatieregels_file" select="document('../../../doc/NLCSValidatieRegels.xml')"/>
  <variable name="scopes" select="$validatieregels_file/nvr:NLCSValidatieregels/nvr:scopes/nvr:scope"/>

  <function name="keronic:get-connected-threshold">
    <value-of select="$config_file/config/V10/Topology/ConnectedThreshold"/>
  </function>

  <function name="keronic:get-ls-cable-min-measurement-distance">
    <value-of select="$config_file/config/V10/LSkabel/MinMeasurementDistance"/>
  </function>

  <function name="keronic:get-ls-cable-max-measurement-distance">
    <value-of select="$config_file/config/V10/LSkabel/MaxMeasurementDistance"/>
  </function>

  <function name="keronic:get-ls-mof-max-cable-connection">
    <value-of select="$config_file/config/V10/LSmof/MaxConnectionCount"/>
  </function>

  <function name="keronic:get-ls-mof-min-cable-connection">
    <value-of select="$config_file/config/V10/LSmof/MinConnectionCount"/>
  </function>

  <function name= "keronic:get-ls-cable-min-measurement-angle">
    <value-of select="$config_file/config/V10/LSkabel/MinMeasurementAngle"/>
  </function>

  <function name= "keronic:get-ms-cable-connections-end">
    <value-of select="$config_file/config/V10/MSkabel/ConnectionCountEnd"/>
  </function>

  <function name= "keronic:get-ms-cable-connections-start">
    <value-of select="$config_file/config/V10/MSkabel/ConnectionCountStart"/>
  </function>

  <function name= "keronic:get-statuses-without-empty-ends" as="xs:string*">
    <sequence select="$config_file/config/V10/MSkabel/WithoutEmptyEnds/Status"/>
  </function>

  <function name= "keronic:v11-get-statuses-without-empty-ends" as="xs:string*">
    <sequence select="$config_file/config/V10/MSkabel/WithoutEmptyEnds/Status"/>
  </function>

  <function name= "keronic:get-bedrijfstoestand-without-empty-ends" as="xs:string*">
    <sequence select="$config_file/config/V11/MSkabel/WithoutEmptyEnds/Bedrijfstoestand"/>
  </function>

  <function name= "keronic:ls-mof-spanning-ls-cable-status-check" as="xs:string*">
    <sequence select="$config_file/config/V10/LSmof/LSkabelSpanningCheck/Status"/>
  </function>

  <function name= "keronic:ls-mof-phase-ls-cable-status-check" as="xs:string*">
    <sequence select="$config_file/config/V10/LSmof/LSkabelPhaseCheck/Status"/>
  </function>

  <function name= "keronic:ls-mof-phase-ls-cable-l1-indication" as="xs:string*">
    <sequence select="$config_file/config/V10/LSmof/LSkabelPhaseCheck/L1"/>
  </function>

  <function name= "keronic:ls-mof-phase-ls-cable-l2-indication" as="xs:string*">
    <sequence select="$config_file/config/V10/LSmof/LSkabelPhaseCheck/L2"/>
  </function>

  <function name= "keronic:ls-mof-phase-ls-cable-l3-indication" as="xs:string*">
    <sequence select="$config_file/config/V10/LSmof/LSkabelPhaseCheck/L3"/>
  </function>

  <function name= "keronic:ls-mof-phase-ls-cable-f3-indication" as="xs:string*">
    <sequence select="$config_file/config/V10/LSmof/LSkabelPhaseCheck/F3"/>
  </function>

  <function name= "keronic:ls-mof-phase-ls-cable-required-count" as="xs:string">
    <sequence select="$config_file/config/V10/LSmof/LSkabelPhaseCheck/RequiredCount"/>
  </function>

  <function name= "keronic:ls-mof-new-ls-cable-count" as="xs:string">
    <value-of select="$config_file/config/V10/LSmof/LSkabelSpanningCheck/RequiredCount"/>
  </function>

  <function name= "keronic:e-aarddraad-connected-buildings-count" as="xs:string">
    <value-of select="$config_file/config/V10/EAarddraad/ConnectedBuildingsCount"/>
  </function>

  <function name= "keronic:ls-cable-get-max-depth" as="xs:string">
    <value-of select="$config_file/config/V10/LSkabel/MaxDepth"/>
  </function>

  <function name= "keronic:ls-cable-get-min-depth" as="xs:string">
    <value-of select="$config_file/config/V10/LSkabel/MinDepth"/>
  </function>

  <function name="keronic:get-connected-maaiveld-threshold" as="xs:string">
    <value-of select="$config_file/config/V10/Topology/ConnectedMaaiveldThreshold"/>
  </function>

  <function name= "keronic:get-translation">
    <param name="message_id"/>
    <variable name="translation" select="$translation_file//message[@id=$message_id]/message-text[@xml:lang=$language]"/>
    <value-of select="$translation"/>
  </function>

  <function name="keronic:element-exists-and-not-empty" as="xs:boolean">
    <param name="element"/>
    <sequence select="$element and normalize-space($element)"/>
  </function>

  <function name="keronic:get-statuses-where-gisid-required" as="xs:string*">
    <sequence select="$config_file/config/V11/GisIdRequiredStatuses/Status"/>
  </function>

  <function name="keronic:get-translation-and-replace-placeholders">
    <param name="message_id"/>
    <param name="placeholders" as="xs:string*"/> <!-- sequence of strings -->
    <variable name="translation" select="keronic:get-translation($message_id)"/>
    <value-of select="keronic:replace-placeholders($translation, $placeholders)"/>
  </function>

  <function name="keronic:replace-placeholders">
    <param name="message" as="xs:string"/>
    <param name="placeholders" as="xs:string*"/> <!-- sequence of strings -->
    <variable name="result">
      <call-template name="keronic:replace-recursively">
        <with-param name="message" select="$message"/>
        <with-param name="placeholders" select="$placeholders"/>
        <with-param name="index" select="1"/> <!-- start at first placeholder -->
      </call-template>
    </variable>
    <value-of select="$result"/>
  </function>

  <!-- Recursively replace {1}, {2}, ... placeholders -->
  <template name="keronic:replace-recursively">
    <param name="message" as="xs:string"/>
    <param name="placeholders" as="xs:string*"/>
    <param name="index" as="xs:integer"/>

    <choose>
      <when test="$index &lt;= count($placeholders)">
        <variable name="placeholder" select="concat('\{', $index, '\}')"/>
        <variable name="value" select="$placeholders[$index]"/>
        <variable name="new_message" select="replace($message, $placeholder, $value)"/>
        <call-template name="keronic:replace-recursively">
          <with-param name="message" select="$new_message"/>
          <with-param name="placeholders" select="$placeholders"/>
          <with-param name="index" select="$index + 1"/>
        </call-template>
      </when>
      <otherwise>
        <value-of select="$message"/>
      </otherwise>
    </choose>
  </template>

  <function name="keronic:rule-string" as="xs:string">
    <param name="rule_number" as="xs:integer"/>
    <value-of select="concat('R.', $rule_number)"/>
  </function>

  <function name="keronic:rule-within-scope-for-object" as="xs:boolean">
    <param name="rule_number" as="xs:integer"/>
    <param name="nlcs_object"/>
    <variable name="rule_string" select="keronic:rule-string($rule_number)"/>

    <variable name="matching_scope" select="keronic:matching-scope($nlcs_object)"/>

    <value-of select="some $rule in $matching_scope/nvr:scopeValidatieRegels/nvr:scopeValidatieRegel satisfies $rule/nvr:nummer = $rule_string"/>
  </function>

  <function name="keronic:rule-severity-within-scope" as="xs:string">
    <param name="rule_number" as="xs:integer"/>
    <param name="nlcs_object"/>
    <variable name="rule_string" select="rule-string($rule_number)"/>

    <variable name="matching_scope" select="keronic:matching-scope($nlcs_object)"/>
    <variable name="validatie_regels" select="$matching_scope/nvr:scopeValidatieRegels/nvr:scopeValidatieRegel"/>

    <value-of select="$validatie_regels[nvr:nummer = $rule_string]/nvr:niveau"/>
  </function>

  <function name="keronic:scope-name" as="xs:string">
    <param name="nlcs_object"/>

    <variable name="matching_scope" select="keronic:matching-scope($nlcs_object)"/>

    <value-of select="$matching_scope/@naam"/>
  </function>

  <function name="keronic:matching-scope">
    <param name="nlcs_object"/>

    <variable name="tekening_type" select="$nlcs_object//preceding-sibling::nlcs:AprojectReferentie/nlcs:TekeningType"/>
    <variable name="status" select="$nlcs_object/nlcs:Status"/>
    <variable name="bedrijfstoestand" select="$nlcs_object/nlcs:Bedrijfstoestand"/>

    <sequence select="$scopes[
                      upper-case(nvr:tekeningSoort) = $tekening_type
                      and nvr:statussen/nvr:status = $status
                      and nvr:bedrijfsToestanden/nvr:bedrijfstoestand = $bedrijfstoestand]"/>
  </function>

</stylesheet>
