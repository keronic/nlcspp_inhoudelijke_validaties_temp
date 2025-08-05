<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron"
         id="v11-hs-msmoffen-have-required-values">
    <rule context="//nlcs:MSmof | //nlcs:HSmof">
        <let name="rule_number" value="10"/>
        <let name="object_type" value="name(.)"/>
        <let name="object_id" value="nlcs:Handle"/>
        
        <assert id="naam_monteur_present"
            test="keronic:element-exists-and-not-empty(nlcs:NaamMonteur)"
            properties="scope rule-number object-type object-id">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['NaamMonteur'])"/>
        </assert>
        
        <assert id="cross_bounding_present"
            test="keronic:element-exists-and-not-empty(nlcs:CrossBoundingAanwezig)"
            properties="scope rule-number object-type object-id">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['CrossboundingAanwezig'])"/>
        </assert>
    </rule>
</pattern>