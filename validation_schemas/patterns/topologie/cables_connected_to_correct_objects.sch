<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="v11-mskabel-connected-to-correct-object">
    <rule context="//nlcs:MSkabel[nlcs:Bedrijfstoestand ne 'VERLATEN']">
        <let name="geometry"
            value="tokenize(normalize-space(nlcs:Geometry/gml:LineString/gml:posList))"/>

        <let name="rule_number" value="21"/>
        <let name="object_type" value="name(.)"/>
        <let name="object_id" value="nlcs:Handle"/>
        <let name="geometry_3d" value="$geometry"/>

        <let name="moffen-geometries"
            value="//nlcs:MSmof/nlcs:Geometry/gml:Point/gml:pos"/>

        <let name="overdrachtspunt-geometries"
            value="//nlcs:MSoverdrachtspunt/nlcs:Geometry/gml:Point/gml:pos"/>

        <let name="station-geometries"
            value="//nlcs:MSstation/nlcs:Geometry/gml:Polygon/gml:exterior/gml:LinearRing/gml:posList"/>

        <let name="first-point"
            value="$geometry[1], $geometry[2], $geometry[3]"
            as="xs:string*"/>

        <let name="last-point"
            value="$geometry[count($geometry) - 2], $geometry[count($geometry) - 1], $geometry[count($geometry)]"
            as="xs:string*"/>

        <let name="first-connected-to-moffen"
            value="keronic:point-3d-connected-to-one-of-several-point-3d($first-point, $moffen-geometries)"/>

        <let name="last-connected-to-moffen"
            value="keronic:point-3d-connected-to-one-of-several-point-3d($last-point, $moffen-geometries)"/>

        <let name="first-connected-to-overdrachtspunt"
            value="keronic:point-3d-connected-to-one-of-several-point-3d($first-point, $overdrachtspunt-geometries)"/>

        <let name="last-connected-to-overdrachtspunt"
            value="keronic:point-3d-connected-to-one-of-several-point-3d($last-point, $overdrachtspunt-geometries)"/>

        <let name="first-connected-to-station"
            value="keronic:point-3d-connected-to-one-of-several-area-3d($first-point, $station-geometries)"/>

        <let name="last-connected-to-station"
            value="keronic:point-3d-connected-to-one-of-several-area-3d($last-point, $station-geometries)"/>

        <let name="first-connected"
            value="$first-connected-to-moffen or $first-connected-to-overdrachtspunt or $first-connected-to-station"/>

        <let name="last-connected"
            value="$last-connected-to-moffen or $last-connected-to-overdrachtspunt or $last-connected-to-station"/>

        <assert test="$first-connected and $last-connected"
                properties="scope rule-number object-type object-id geometry-3d">
            <value-of select="keronic:get-translation-and-replace-placeholders('cable-not-connected-to-valid-object', [nlcs:Handle])"/>
        </assert>
    </rule>
</pattern>
