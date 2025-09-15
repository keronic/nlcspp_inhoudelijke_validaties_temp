<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="gisid-en-assetid" abstract="true">
    <rule context="//nlcs:MSstation | //nlcs:MSkabel | //nlcs:MSmof | //nlcs:Amantelbuis">
        <let name="statuses-requiring-ids"
            value="('BESTAAND', 'REVISIE', 'VERWIJDERD')"/>

        <let name="status-requires-ids"
            value="some $status in ($statuses-requiring-ids) satisfies($status = nlcs:Status)"/>

        <let name="object-has-gis-id"
            value="keronic:element-exists-and-not-empty(nlcs:GisId)"/>

        <let name="object-has-asset-id"
            value="keronic:element-exists-and-not-empty(nlcs:AssetId)"/>

        <assert id="gisid-assetid-not-unset-if-revision-existing"
            test="not($status-requires-ids) or ($object-has-gis-id and $object-has-asset-id)"
            properties="scope rule-number severity object-type object-id">
            <value-of select="keronic:get-translation-and-replace-placeholders('gisid-assetid-not-unset-if-new-revision-existing', [string-join($statuses-requiring-ids, ', ')])"/>
        </assert>

        <assert id="gisid-assetid-are-unset-if-new"
            test="$status-requires-ids or not($object-has-gis-id or $object-has-asset-id)"
            properties="scope rule-number severity object-type object-id">
            <value-of select="keronic:get-translation-and-replace-placeholders('gisid-assetid-are-unset-if-new', [string-join($statuses-requiring-ids, ', ')])"/>
        </assert>
    </rule>
</pattern>
