<stylesheet xmlns="http://www.w3.org/1999/XSL/Transform"
            xmlns:math="http://www.w3.org/2005/xpath-functions/math"
            xmlns:keronic="http://example.com/my-functions"
            xmlns:xs="http://www.w3.org/2001/XMLSchema"
            xmlns:map="http://www.w3.org/2005/xpath-functions/map"
            xmlns:nlcs="NLCSnetbeheer"
            xmlns:nvr="NLCSValidatieRegelsNameSpace"
            version="3.0">

  <variable name="sys_config_file" select= "document('../../../configuration/sys_config.xml')"/>
  <variable name="user_config_file" select= "document('../../../configuration/user_config.xml')"/>
  <variable name="language" select= "$user_config_file/config/Language"/>
  <variable name="translation_file" select= "document('../../../localization/messages.xml')"/>
  <variable name="validatieregels_file" select="document('../../../doc/NLCSValidatieRegels.xml')"/>
  <variable name="scopes" select="$validatieregels_file/nvr:NLCSValidatieregels/nvr:scopes/nvr:scope"/>
  
  <function name="keronic:get-connected-threshold">
    <value-of select="number($sys_config_file/config/V11/Threshold)"/>
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
    <sequence select="$sys_config_file/config/V11/GisIdRequiredStatuses/Status"/>
  </function>
  
  <function name="keronic:map-mof-functie" as="xs:string">
    <param name="functie" as="xs:string"/>
    <sequence select="name(($sys_config_file/config/V11/MofFuncties/*[Functie = $functie]))"/>
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
    <variable name="object_type" select="name($nlcs_object)"/>

    <choose>
      <when test="$object_type = 'NLCSnetbeheerType'">
        <value-of select="true()"/>
      </when>
      <otherwise>
        <variable name="rule_string" select="keronic:rule-string($rule_number)"/>
        <variable name="matching_scope" select="keronic:matching-scope($nlcs_object)"/>
        <variable name="scope_validation_rules" select="$matching_scope/nvr:scopeValidatieRegels/nvr:scopeValidatieRegel"/>

        <value-of select="some $rule in $scope_validation_rules satisfies $rule/nvr:nummer = $rule_string"/>
      </otherwise>
    </choose>
  </function>

  <function name="keronic:rule-severity-within-scope" as="xs:string">
    <param name="rule_number" as="xs:integer"/>
    <param name="nlcs_object"/>
    <variable name="object_type" select="name($nlcs_object)"/>

    <choose>
      <when test="$object_type = 'NLCSnetbeheerType'">
        <value-of select="'Fout'"/>
      </when>
      <otherwise>
        <variable name="rule_string" select="keronic:rule-string($rule_number)"/>
        <variable name="matching_scope" select="keronic:matching-scope($nlcs_object)"/>
        <variable name="scope_validation_rules" select="$matching_scope/nvr:scopeValidatieRegels/nvr:scopeValidatieRegel"/>

        <value-of select="$scope_validation_rules[nvr:nummer = $rule_string]/nvr:niveau"/>
      </otherwise>
    </choose>
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
