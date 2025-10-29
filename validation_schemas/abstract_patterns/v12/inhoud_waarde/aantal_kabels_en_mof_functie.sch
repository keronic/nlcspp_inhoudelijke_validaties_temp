<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="aantal-kabels-en-mof-functie" abstract="true">
    <rule context="//nlcs:MSmof[keronic:map-mof-functie(nlcs:Functie) = 'Eind']">
        <let name="msmof"
            value="."/>

        <let name="connected_mskabels"
            value="//nlcs:MSkabel[keronic:line-3d-connected-to-point-3d(
                        tokenize(normalize-space(nlcs:Geometry/gml:LineString/gml:posList)),
                        tokenize(normalize-space($msmof/nlcs:Geometry/gml:Point/gml:pos)),
                        0)]"/>

        <let name="required_connections"
            value="1"/>

        <assert id="eindmof_connected_to_right_amount_of_cables"
                properties="scope rule-number severity object-type object-id"
            test="count($connected_mskabels) = $required_connections">
            <value-of select="keronic:get-translation-and-replace-placeholders('cable-amount-incorrect', [string($required_connections), string(count($connected_mskabels))])"/>
        </assert>
    </rule>
    <rule context="//nlcs:MSmof[keronic:map-mof-functie(nlcs:Functie) = 'Verbinding']">
        <let name="msmof"
            value="."/>

        <let name="connected_mskabels"
            value="//nlcs:MSkabel[keronic:line-3d-connected-to-point-3d(
                        tokenize(normalize-space(nlcs:Geometry/gml:LineString/gml:posList)),
                        tokenize(normalize-space($msmof/nlcs:Geometry/gml:Point/gml:pos)),
                        0)]"/>

        <let name="connected_mskabels_count"
            value="count($connected_mskabels)"/>

        <let name="required_connections"
            value="[2, 4]"/>

        <assert id="verbindingsmof_connected_to_right_amount_of_cables"
            properties="scope rule-number severity object-type object-id"
            test="$connected_mskabels_count = $required_connections">
            <value-of select="keronic:get-translation-and-replace-placeholders('cable-amount-incorrect', [string-join($required_connections, ' / '), string($connected_mskabels_count)])"/>
        </assert>
    </rule>
    <rule context="//nlcs:MSmof[keronic:map-mof-functie(nlcs:Functie) = 'Aftak']">
        <let name="msmof"
            value="."/>

        <let name="connected_mskabels"
            value="//nlcs:MSkabel[keronic:line-3d-connected-to-point-3d(
                        tokenize(normalize-space(nlcs:Geometry/gml:LineString/gml:posList)),
                        tokenize(normalize-space($msmof/nlcs:Geometry/gml:Point/gml:pos)),
                        0)]"/>

        <let name="connected_mskabels_count"
            value="count($connected_mskabels)"/>

        <let name="required_connections"
            value="[2, 3]"/>

        <assert id="aftakmof_connected_to_right_amount_of_cables"
            properties="scope rule-number severity object-type object-id"
            test="$connected_mskabels_count = $required_connections">
            <value-of select="keronic:get-translation-and-replace-placeholders('cable-amount-incorrect', [string-join($required_connections, ' / '), string($connected_mskabels_count)])"/>
        </assert>

        <let name="connected_mskabels_one_is_new_one_is_existing"
            value="count($connected_mskabels[./nlcs:Status = 'NIEUW']) = 1 and count($connected_mskabels[./nlcs:Status = 'BESTAAND']) = 1"/>

        <assert id="aftakmof_existing_cable_connected_to_new_cable"
            properties="scope rule-number severity object-type object-id"
            test="if($connected_mskabels_count = 2) then $connected_mskabels_one_is_new_one_is_existing else true() ">
            <value-of select="keronic:get-translation('bestaande-cable-not-connected-to-new-cable')"/>
        </assert>
    </rule>
</pattern>
