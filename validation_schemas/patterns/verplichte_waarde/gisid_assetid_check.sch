<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="v11-gisid-assetid-check">
    <rule context="//nlcs:MSstation | //nlcs:MSkabel | //nlcs:MSmof | //nlcs:Amantelbuis">        
        <let name="statuses"
            value="keronic:get-statuses-where-gisid-required()"/>
        
        <let name="status-requires-id"
            value="some $status in ($statuses) satisfies($status = nlcs:Status)"/>
        
        <let name="statuses-in-object"
            value="keronic:elements-exist-and-not-empty((nlcs:GisId, nlcs:AssetId))"/>
        
        <let name="rule_number" value="5"/>
        <let name="object_type" value="name(.)"/>
        <let name="object_id" value="nlcs:Handle"/>
        
        <assert id="gisid-assetid-not-unset-if-revision-existing"
            test="not($status-requires-id) or $statuses-in-object"
            properties="scope rule-number object-type object-id">
            <value-of select="keronic:get-translation-and-replace-placeholders('gisid-assetid-not-unset-if-new-revision-existing', [string-join($statuses, ', ')])"/>
        </assert>

        <assert id="gisid-assetid-are-unset-if-new"
            test="$status-requires-id or not(nlcs:GisId or nlcs:AssetId)"
            properties="scope rule-number object-type object-id">
            <value-of select="keronic:get-translation-and-replace-placeholders('gisid-assetid-are-unset-if-new', [string-join($statuses, ', ')])"/>
        </assert>
    </rule>
</pattern>