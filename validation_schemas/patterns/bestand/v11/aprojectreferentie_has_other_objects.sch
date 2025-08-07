<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="v11-aprojectreferentie-has-other-objects">
    <rule context="//nlcs:NLCSnetbeheerType">
        <let name="rule_number" value="1"/>

        <let name="nlcs_objects"
            value="*[not(self::nlcs:VersieNummer or self::nlcs:AprojectReferentie)]"/>

        <assert id="file-has-aprojectreferentie" 
            test="count($aprojectreferenties) = 1"
            properties="rule-number">
            <value-of select="keronic:get-translation('aprojectreferentie-not-present')"/>
        </assert>

        <let name="aprojectreferenties"
            value="nlcs:AprojectReferentie"/>

        <assert id="file-has-nlcs-objects" 
            test="count($nlcs_objects) > 0"
            properties="scope rule-number">
            <value-of select="keronic:get-translation('no-nlcs-objects-present')"/>
        </assert>
    </rule>
</pattern>
    
