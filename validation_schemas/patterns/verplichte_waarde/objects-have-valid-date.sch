<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="v11-objects-have-valid-date">
    <rule context="//nlcs:MSstation | //nlcs:MSkabel | //nlcs:MSmof | //nlcs:MSoverdrachtspunt">
        
        <let name="rule_number" value="9"/>
        <let name="object_type" value="name(.)"/>
        <let name="object_id" value="nlcs:Handle"/>
        
        <let name="datum-aanleg-present"
            value="keronic:element-exists-and-not-empty(nlcs:DatumAanleg)"/>
        
        <assert id="date-exists"
                properties="scope rule-number object-type object-id"
            test="$datum-aanleg-present">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['DatumAanleg'])"/>
        </assert>
        
        <assert id="date-not-in-future"
                properties="scope rule-number object-type object-id"
            test="not($datum-aanleg-present) or (xs:date(nlcs:DatumAanleg) le current-date())">
            <value-of select="keronic:get-translation('date-in-the-future')"/>
        </assert>
    </rule>
</pattern>