<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="v11-objects-have-valid-date">
    <rule context="//nlcs:MSstation | //nlcs:MSkabel | //nlcs:MSmof | //nlcs:MSoverdrachtspunt">
        
        <let name="rule_number" value="9"/>
        <let name="object_type" value="name(.)"/>
        <let name="object_id" value="nlcs:Handle"/>
        
        <let name="datumaanleg"
            value="nlcs:DatumAanleg"/>
        
        <assert id="date-exists"
                properties="scope rule-number object-type object-id"
            test="keronic:element-exists-and-not-empty($datumaanleg)">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['DatumAanleg'])"/>
        </assert>
        
        <!-- Only flag this if the datumaanleg exists, otherwise the first assert will catch it anyway -->
        <assert id="date-not-in-future"
                properties="scope rule-number object-type object-id"
            test="if ($datumaanleg) then xs:date($datumaanleg) le current-date() else true()">
            <value-of select="keronic:get-translation-and-replace-placeholders('date-in-the-future', [])"/>
        </assert>
    </rule>
</pattern>