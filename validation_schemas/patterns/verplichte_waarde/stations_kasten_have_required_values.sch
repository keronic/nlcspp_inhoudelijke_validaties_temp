<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="v11-stations-kasten-have-required-values">
    <rule context="//nlcs:LSkast | //nlcs:MSstation | //HSstation">
        <let name="rule_number" value="14"/>
        <let name="object_type" value="name(.)"/>
        <let name="object_id" value="nlcs:Handle"/>

        <assert id="object-has-functie"
            test="keronic:element-exists-and-not-empty(nlcs:Functie)"
            properties="scope rule-number object-type object-id">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Functie'])"/>
        </assert>

        <assert id="object-has-number"
            test="keronic:element-exists-and-not-empty(nlcs:Nummer)"
            properties="scope rule-number object-type object-id">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Nummer'])"/>
        </assert>
    </rule>
</pattern>
