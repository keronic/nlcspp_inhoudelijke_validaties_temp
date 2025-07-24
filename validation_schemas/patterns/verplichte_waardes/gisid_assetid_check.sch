<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="r5-gisid-assetid-check">
    <rule context="//nlcs:MSstation | //nlcs:MSkabel | //nlcs:MSmof | //nlcs:Amantelbuis">        
        <let name="statuses"
            value="keronic:get-statuses-where-gisid-required()"/>
        
        <let name="status-requires-id"
            value="some $status in ($statuses) satisfies($status = nlcs:Status)"/>
        
        <let name="statuses-in-object"
            value="keronic:elements-exist-and-not-empty((nlcs:GisId, nlcs:AssetId))"/>
        
        <let name="placeholders"
            value="let $map := map{
                        'handle': $handle   
                    }
                return $map
            "/>
        
        <let name="placeholders"
            value="let $map := map{
                        'handle': $handle,
                        'statuses': $statuses 
                    }
                return $map
            "/>
        
        <let name="revision-existing-message"
            value="keronic:get-translation('gisId-assetId-not-unset-if-new-revision-existing')"/>
        
        <let name="new-message"
            value="keronic:get-translation('gisId-assetId-are-unset-if-new')"/>
        
        <assert id="gisId-assetId-not-unset-if-revision-existing"
            test="not($status-requires-id) or $statuses-in-object">
            <value-of select="keronic:replace-placeholders($revision-existing-message, $placeholders)"/>
        </assert>
        
        <assert id="gisId-assetId-are-unset-if-new"
            test="$status-requires-id or not(nlcs:GisId or nlcs:AssetId)">
            <value-of select="keronic:replace-placeholders($new-message, $placeholders)"/>
        </assert>
    </rule>
</pattern>