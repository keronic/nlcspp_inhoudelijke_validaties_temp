<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="v11-gisid-assetid-check">
    <rule context="//nlcs:MSstation | //nlcs:MSkabel | //nlcs:MSmof | //nlcs:Amantelbuis">        
        <let name="statuses"
            value="keronic:get-statuses-where-gisid-required()"/>
        
        <let name="status-requires-id"
            value="some $status in ($statuses) satisfies($status = nlcs:Status)"/>
        
        <let name="statuses-in-object"
            value="keronic:elements-exist-and-not-empty((nlcs:GisId, nlcs:AssetId))"/>
        

        <let name="handle"
            value="nlcs:Handle"/>

        <let name="placeholders"
            value="[$handle, string-join($statuses, ', ')]
            "/>
        
        <assert id="gisId-assetId-not-unset-if-revision-existing"
            test="not($status-requires-id) or $statuses-in-object">
            <value-of select="keronic:get-translation-and-replace-placeholders('gisId-assetId-not-unset-if-new-revision-existing', $placeholders)"/>
        </assert>
        
        <assert id="gisId-assetId-are-unset-if-new"
            test="$status-requires-id or not(nlcs:GisId or nlcs:AssetId)">
            <value-of select="keronic:get-translation-and-replace-placeholders('gisId-assetId-are-unset-if-new', $placeholders)"/>
        </assert>
    </rule>
</pattern>