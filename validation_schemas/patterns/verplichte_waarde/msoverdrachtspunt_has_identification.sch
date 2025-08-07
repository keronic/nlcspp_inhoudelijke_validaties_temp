<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="v11-msoverdrachtspunt-has-identification">
    <rule context="//nlcs:MSoverdrachtspunt">
        <let name="rule_number" value="13"/>
        <let name="object_type" value="name(.)"/>
        <let name="object_id" value="nlcs:Handle"/>
        
        <assert id="v11-msoverdrachtspunt-has-identification"
            test="keronic:element-exists-and-not-empty(nlcs:Identificatie)"
            properties="scope rule-number object-type object-id">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Identificatie'])"/>
        </assert>
    </rule>
</pattern>