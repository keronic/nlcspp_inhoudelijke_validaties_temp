<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="v11-cables-have-subnettype">
    <rule context="//nlcs:MSkabel | //nlcs:LSkabel | nlcs:LSmof">
        <let name="rule_number" value="7"/>
        <let name="object_type" value="name(.)"/>
        <let name="object_id" value="nlcs:Handle"/>

        <assert id="subnettype-present"
            test="keronic:element-exists-and-not-empty(nlcs:Subnettype)"
            properties="scope rule-number object-type object-id">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Subnettype'])"/>
        </assert>
    </rule>
</pattern>
