<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron"
         id="v11-moffen-have-required-values">
    <rule context="//nlcs:MSmof | //nlcs:HSmof">
        <let name="rule_number" value="10"/>
        <let name="object_type" value="name(.)"/>
        <let name="object_id" value="nlcs:Handle"/>

        <assert id="functie_present"
            test="keronic:element-exists-and-not-empty(nlcs:Functie)"
            properties="scope rule-number object-type object-id">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Functie'])"/>
        </assert>

        <assert id="verbindingnummer_present"
            test="keronic:element-exists-and-not-empty(nlcs:Verbindingnummer)"
            properties="scope rule-number object-type object-id">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Verbindingnummer'])"/>
        </assert>
    </rule>
    <rule context="//nlcs:LSmof">
        <let name="rule_number" value="10"/>
        <let name="object_type" value="name(.)"/>
        <let name="object_id" value="nlcs:Handle"/>

        <assert id="functie_present"
            test="keronic:element-exists-and-not-empty(nlcs:Functie)"
            properties="scope rule-number object-type object-id">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Functie'])"/>
        </assert>

        <assert id="verbindingnummer_present"
            test="keronic:element-exists-and-not-empty(nlcs:Verbindingnummer)"
            properties="scope rule-number object-type object-id">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Verbindingnummer'])"/>
        </assert>

        <assert id="bovengronds_present"
            test="keronic:element-exists-and-not-empty(nlcs:Bovengronds)"
            properties="scope rule-number object-type object-id">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Bovengronds'])"/>
        </assert>
    </rule>
</pattern>
