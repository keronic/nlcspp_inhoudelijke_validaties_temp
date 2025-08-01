<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="v11-mantelbuis-has-required-values">     
    <rule context="//nlcs:Amantelbuis">
        <let name="rule_number" value="15"/>
        <let name="object_type" value="name(.)"/>
        <let name="object_id" value="nlcs:Handle"/>
        
        <assert id="mantelbuis-has-thema"
            test="keronic:element-exists-and-not-empty(nlcs:Thema)"
            properties="rule-number object-type object-id">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Thema'])"/>
        </assert>

        <assert id="mantelbuis-has-materiaal"
            test="keronic:element-exists-and-not-empty(nlcs:Materiaal)"
            properties="rule-number object-type object-id">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Materiaal'])"/>
        </assert>
        
        <assert id="mantelbuis-has-diameter"
            test="keronic:element-exists-and-not-empty(nlcs:Diameter)"
            properties="rule-number object-type object-id">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Diameter'])"/>
        </assert>
    </rule>
</pattern>