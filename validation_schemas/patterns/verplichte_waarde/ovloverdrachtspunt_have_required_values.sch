<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="v11-ovloverdrachtspunt-has-required-values">
    <rule context="//nlcs:OVLoverdrachtspunt">
        <let name="rule_number" value="12"/>
        <let name="object_type" value="name(.)"/>
        <let name="object_id" value="nlcs:Handle"/>
        
        <assert id="aansluitset-present"
            test="keronic:element-exists-and-not-empty(nlcs:Aansluitset)"
            properties="rule-number object-type object-id">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Aansluitset'])"/>
        </assert>
        
        <assert id="mastnummer-present" 
            test="keronic:element-exists-and-not-empty(nlcs:Mastnummer)"
            properties="rule-number object-type object-id">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Mastnummer'])"/>
        </assert>
    </rule>
</pattern>
